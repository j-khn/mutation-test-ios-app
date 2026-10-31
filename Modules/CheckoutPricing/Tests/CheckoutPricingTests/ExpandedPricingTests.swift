import CheckoutPricing
import Testing

@Suite("Promotion and tax cases")
struct ExpandedPricingTests {
    @Test("checks promotion and tax boundaries")
    func promotionAndTaxCases() {
        let promotion = PromotionEngine()
        #expect(promotion.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(promotion.isEligible(subtotalCents: 1_000, minimumSpendCents: 1_000, customerIsEligible: true))
        #expect(promotion.canStack(isStackable: true, existingPromotionCount: 0))

        let tax = TaxCalculator()
        #expect(tax.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(tax.isValidRate(10_000))
        #expect(!tax.isValidRate(10_001))
    }
}
