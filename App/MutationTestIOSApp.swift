import CheckoutCustomer
import CheckoutDomain
import CheckoutInventory
import CheckoutShipping
import Observation
import SwiftUI

@main
struct MutationTestIOSApp: App {
    var body: some Scene {
        WindowGroup { CheckoutScreen() }
    }
}

struct CheckoutScreen: View {
    @State private var model = CheckoutViewModel()
    private let formatter = ReceiptFormatter()

    var body: some View {
        NavigationStack {
            Form {
                Section("Order") {
                    Stepper("Quantity: \(model.quantity)", value: $model.quantity, in: 1...20)
                    LabeledContent("Unit price", value: formatter.format(cents: model.unitPriceCents))
                    Stepper("Discount: \(model.discountPercent)%", value: $model.discountPercent, in: 0...100)
                    Button("Calculate receipt") { model.calculate() }
                }
                if let receipt = model.receipt {
                    Section("Receipt") {
                        CheckoutSummaryView(receipt: receipt)
                        LabeledContent("Shipping", value: formatter.format(cents: model.shippingCents))
                        LabeledContent("Amount to pay", value: formatter.format(cents: model.payableCents))
                        LabeledContent("Loyalty points", value: "\(model.points)")
                    }
                }
                if let message = model.errorMessage {
                    Text(message).foregroundStyle(.red).accessibilityIdentifier("checkoutError")
                }
            }
            .navigationTitle("Mutation Checkout")
            .onAppear { model.calculate() }
        }
    }
}

struct CheckoutSummaryView: View {
    let receipt: CheckoutReceipt

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Subtotal: \(receipt.subtotalCents)¢")
            Text("Discount: \(receipt.discountCents)¢")
            Text("Tax: \(receipt.taxCents)¢")
            Text("Total: \(receipt.totalCents)¢").font(.headline)
        }
        .accessibilityElement(children: .combine)
    }
}

@MainActor
@Observable
final class CheckoutViewModel {
    var quantity = 2
    var unitPriceCents = 1_999
    var discountPercent = 10
    var taxBasisPoints = 825
    var weightGrams = 750
    var availableStock = 20

    private(set) var receipt: CheckoutReceipt?
    private(set) var shippingCents = 0
    private(set) var points = 0
    private(set) var errorMessage: String?

    var payableCents: Int { (receipt?.totalCents ?? 0) + shippingCents }

    func calculate() {
        receipt = nil
        shippingCents = 0
        points = 0
        errorMessage = nil

        guard InventoryPolicy().canFulfill(
            requested: quantity,
            available: availableStock,
            isDiscontinued: false
        ) else {
            errorMessage = "Choose a quantity between 1 and the available stock."
            return
        }

        do {
            let result = try CheckoutCalculator().receipt(
                unitPriceCents: unitPriceCents,
                quantity: quantity,
                discountPercent: discountPercent,
                taxBasisPoints: taxBasisPoints
            )
            receipt = result
            shippingCents = ShippingCalculator().feeCents(
                subtotalCents: result.subtotalCents,
                weightGrams: weightGrams
            )
            points = LoyaltyPointsCalculator().pointsEarned(
                eligibleSpendCents: result.subtotalCents - result.discountCents
            )
        } catch {
            errorMessage = "Check the discount and tax values, then try again."
        }
    }
}
