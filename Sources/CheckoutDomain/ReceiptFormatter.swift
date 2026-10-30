import Foundation

public struct ReceiptFormatter: Sendable {
    public init() {}

    public func format(cents: Int, currencyCode: String = "USD", locale: Locale = Locale(identifier: "en_US")) -> String {
        let amount = Decimal(cents) / 100
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = currencyCode
        formatter.locale = locale
        return formatter.string(from: amount as NSDecimalNumber) ?? "\(currencyCode) \(amount)"
    }
}
