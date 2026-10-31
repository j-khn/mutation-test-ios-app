import CheckoutPricing
import Testing

@Suite("CheckoutPricing boundary cases")
struct ExpandedPricingTests {
    @Test("calculates percentage discounts across subtotals", arguments: Array(1...350))
    func discounts(subtotal: Int) {
        let cents = subtotal * 100
        #expect(PromotionEngine().discountCents(subtotalCents: cents, percent: 15) == cents * 15 / 100)
    }

    @Test("applies promotion caps", arguments: Array(1...350))
    func discountCaps(subtotal: Int) {
        let cents = subtotal * 100
        let cap = subtotal * 7
        #expect(PromotionEngine().discountCents(subtotalCents: cents, percent: 30, maximumDiscountCents: cap) == min(cents * 30 / 100, cap))
    }

    @Test("checks promotion minimum spend", arguments: Array(0...250))
    func promotionEligibility(spend: Int) {
        #expect(PromotionEngine().isEligible(subtotalCents: spend, minimumSpendCents: 100, customerIsEligible: true) == (spend >= 100))
        #expect(!PromotionEngine().isEligible(subtotalCents: spend, minimumSpendCents: 100, customerIsEligible: false))
    }

    @Test("calculates tax across basis point rates", arguments: Array(stride(from: 0, through: 10_000, by: 50)))
    func taxRates(rate: Int) {
        let amount = 10_000
        #expect(TaxCalculator().taxCents(amountCents: amount, rateBasisPoints: rate) == (amount * rate + 5_000) / 10_000)
        #expect(TaxCalculator().isValidRate(rate))
    }

    @Test("rejects tax rates outside the supported range", arguments: [-10_000, -1, 10_001, 20_000])
    func invalidTaxRates(rate: Int) {
        #expect(!TaxCalculator().isValidRate(rate))
    }

    @Test("extracts tax from inclusive prices", arguments: Array(1...350))
    func taxInclusiveAmounts(amount: Int) {
        let cents = amount * 100
        let net = TaxCalculator().taxExclusiveAmount(inclusiveCents: cents, rateBasisPoints: 2_000)
        #expect(net <= cents)
        #expect(net > 0)
        #expect(net + TaxCalculator().taxCents(amountCents: net, rateBasisPoints: 2_000) >= cents - 1)
    }

    @Test("allows only one stackable promotion", arguments: Array(0...350))
    func promotionStacking(existingCount: Int) {
        #expect(PromotionEngine().canStack(isStackable: true, existingPromotionCount: existingCount) == (existingCount == 0))
        #expect(!PromotionEngine().canStack(isStackable: false, existingPromotionCount: existingCount))
    }
}
