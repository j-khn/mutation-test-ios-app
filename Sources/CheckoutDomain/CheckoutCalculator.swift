import Foundation

public enum CheckoutError: Error, Equatable {
    case invalidQuantity
    case invalidDiscount
    case invalidTaxRate
}

public struct CheckoutReceipt: Equatable, Sendable {
    public let subtotalCents: Int
    public let discountCents: Int
    public let taxCents: Int
    public let totalCents: Int

    public init(subtotalCents: Int, discountCents: Int, taxCents: Int, totalCents: Int) {
        self.subtotalCents = subtotalCents
        self.discountCents = discountCents
        self.taxCents = taxCents
        self.totalCents = totalCents
    }
}

public struct CheckoutCalculator: Sendable {
    public init() {}

    public func receipt(unitPriceCents: Int, quantity: Int, discountPercent: Int, taxBasisPoints: Int) throws -> CheckoutReceipt {
        guard quantity > 0 else { throw CheckoutError.invalidQuantity }
        guard (0...100).contains(discountPercent) else { throw CheckoutError.invalidDiscount }
        guard (0...10_000).contains(taxBasisPoints) else { throw CheckoutError.invalidTaxRate }

        let subtotal = unitPriceCents * quantity
        let discount = (subtotal * discountPercent + 50) / 100
        let taxable = subtotal - discount
        let tax = (taxable * taxBasisPoints + 5_000) / 10_000
        return CheckoutReceipt(subtotalCents: subtotal, discountCents: discount, taxCents: tax, totalCents: taxable + tax)
    }
}
