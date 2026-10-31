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
}
