import CheckoutDomain
import Foundation
import Testing

@Suite("Checkout calculation and formatting")
struct CheckoutCoreTests {
    let calculator = CheckoutCalculator()
    let formatter = ReceiptFormatter()

    @Test("calculates discount, tax, and total in integer cents")
    func standardReceipt() throws {
        let receipt = try calculator.receipt(unitPriceCents: 1_999, quantity: 2, discountPercent: 10, taxBasisPoints: 825)
        #expect(receipt.subtotalCents == 3_998)
        #expect(receipt.discountCents == 400)
        #expect(receipt.taxCents == 297)
        #expect(receipt.totalCents == 3_895)
    }

    @Test("calculates a receipt without discount or tax")
    func noDiscountOrTax() throws {
        let receipt = try calculator.receipt(unitPriceCents: 2_500, quantity: 3, discountPercent: 0, taxBasisPoints: 0)
        #expect(receipt.subtotalCents == 7_500)
        #expect(receipt.discountCents == 0)
        #expect(receipt.taxCents == 0)
        #expect(receipt.totalCents == 7_500)
    }

    @Test("a full discount produces a zero total")
    func fullDiscount() throws {
        let receipt = try calculator.receipt(unitPriceCents: 1_250, quantity: 4, discountPercent: 100, taxBasisPoints: 825)
        #expect(receipt.discountCents == receipt.subtotalCents)
        #expect(receipt.taxCents == 0)
        #expect(receipt.totalCents == 0)
    }

    @Test("rounds a half-cent discount upward")
    func discountHalfCentRoundsUp() throws {
        let receipt = try calculator.receipt(unitPriceCents: 50, quantity: 1, discountPercent: 1, taxBasisPoints: 0)
        #expect(receipt.discountCents == 1)
        #expect(receipt.totalCents == 49)
    }

    @Test("rounds a discount below half a cent downward")
    func discountBelowHalfCentRoundsDown() throws {
        let receipt = try calculator.receipt(unitPriceCents: 49, quantity: 1, discountPercent: 1, taxBasisPoints: 0)
        #expect(receipt.discountCents == 0)
        #expect(receipt.totalCents == 49)
    }

    @Test("rounds a half-cent tax upward")
    func taxHalfCentRoundsUp() throws {
        let receipt = try calculator.receipt(unitPriceCents: 5, quantity: 1, discountPercent: 0, taxBasisPoints: 1_000)
        #expect(receipt.taxCents == 1)
        #expect(receipt.totalCents == 6)
    }

    @Test("formats zero and positive cents as US dollars")
    func formatsUSD() {
        #expect(formatter.format(cents: 1_250) == "$12.50")
        #expect(formatter.format(cents: 0) == "$0.00")
    }

    @Test("formats euros using the requested locale")
    func formatsEUR() {
        let german = Locale(identifier: "de_DE")
        #expect(formatter.format(cents: 1_250, currencyCode: "EUR", locale: german) == "12,50 €")
    }

    @Test("formats a negative amount")
    func formatsNegativeAmount() {
        #expect(formatter.format(cents: -125) == "-$1.25")
    }

    @Test("rejects a negative unit price")
    func rejectsNegativeUnitPrice() {
        #expect(throws: CheckoutError.self) {
            try calculator.receipt(unitPriceCents: -1, quantity: 1, discountPercent: 0, taxBasisPoints: 0)
        }
    }

    @Test("rejects zero and negative quantities")
    func rejectsInvalidQuantities() {
        #expect(throws: CheckoutError.self) {
            try calculator.receipt(unitPriceCents: 100, quantity: 0, discountPercent: 0, taxBasisPoints: 0)
        }
        #expect(throws: CheckoutError.self) {
            try calculator.receipt(unitPriceCents: 100, quantity: -1, discountPercent: 0, taxBasisPoints: 0)
        }
    }

    @Test("rejects discounts outside zero through one hundred")
    func rejectsInvalidDiscounts() {
        #expect(throws: CheckoutError.self) {
            try calculator.receipt(unitPriceCents: 100, quantity: 1, discountPercent: -1, taxBasisPoints: 0)
        }
        #expect(throws: CheckoutError.self) {
            try calculator.receipt(unitPriceCents: 100, quantity: 1, discountPercent: 101, taxBasisPoints: 0)
        }
    }

    @Test("rejects tax rates outside zero through ten thousand basis points")
    func rejectsInvalidTaxRates() {
        #expect(throws: CheckoutError.self) {
            try calculator.receipt(unitPriceCents: 100, quantity: 1, discountPercent: 0, taxBasisPoints: -1)
        }
        #expect(throws: CheckoutError.self) {
            try calculator.receipt(unitPriceCents: 100, quantity: 1, discountPercent: 0, taxBasisPoints: 10_001)
        }
    }
}
