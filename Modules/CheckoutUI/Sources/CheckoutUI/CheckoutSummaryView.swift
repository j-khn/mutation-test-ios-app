#if canImport(SwiftUI)
import CheckoutDomain
import SwiftUI

public struct CheckoutSummaryView: View {
    public let receipt: CheckoutReceipt

    public init(receipt: CheckoutReceipt) {
        self.receipt = receipt
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Subtotal: \(receipt.subtotalCents)¢")
            Text("Discount: \(receipt.discountCents)¢")
            Text("Tax: \(receipt.taxCents)¢")
            Text("Total: \(receipt.totalCents)¢").font(.headline)
        }
        .accessibilityElement(children: .combine)
    }
}
#endif
