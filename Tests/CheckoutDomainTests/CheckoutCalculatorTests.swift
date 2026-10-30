import CheckoutDomain
import Testing

@Suite("Checkout calculation")
struct CheckoutCalculatorTests {
    let calculator = CheckoutCalculator()

    @Test("calculates discount, tax, and total in integer cents")
    func calculatesReceipt() throws {
        let receipt = try calculator.receipt(unitPriceCents: 1_999, quantity: 2, discountPercent: 10, taxBasisPoints: 825)
        #expect(receipt.subtotalCents == 3_998)
        #expect(receipt.discountCents == 400)
        #expect(receipt.taxCents == 297)
        #expect(receipt.totalCents == 3_895)
    }

    @Test("rounds half cents up")
    func roundsHalfUp() throws {
        let receipt = try calculator.receipt(unitPriceCents: 1, quantity: 1, discountPercent: 50, taxBasisPoints: 0)
        #expect(receipt.discountCents == 1)
        #expect(receipt.totalCents == 0)
    }

    @Test("accepts boundary values")
    func acceptsBoundaries() throws {
        let receipt = try calculator.receipt(unitPriceCents: 100, quantity: 1, discountPercent: 0, taxBasisPoints: 10_000)
        #expect(receipt.discountCents == 0)
        #expect(receipt.taxCents == 100)
        #expect(receipt.totalCents == 200)
    }

    @Test("rejects invalid quantity")
    func rejectsQuantity() {
        #expect(throws: CheckoutError.invalidQuantity) {
            try calculator.receipt(unitPriceCents: 100, quantity: 0, discountPercent: 0, taxBasisPoints: 0)
        }
    }

    @Test("rejects discount outside zero through one hundred")
    func rejectsDiscount() {
        #expect(throws: CheckoutError.invalidDiscount) {
            try calculator.receipt(unitPriceCents: 100, quantity: 1, discountPercent: 101, taxBasisPoints: 0)
        }
    }

    @Test("rejects tax rate above one hundred percent")
    func rejectsTaxRate() {
        #expect(throws: CheckoutError.invalidTaxRate) {
            try calculator.receipt(unitPriceCents: 100, quantity: 1, discountPercent: 0, taxBasisPoints: 10_001)
        }
    }
}
