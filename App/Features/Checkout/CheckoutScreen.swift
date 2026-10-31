import CheckoutDomain
import CheckoutUI
import SwiftUI

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
