import CheckoutPricing
import Testing

@Suite("PricingRateLogic")
struct PricingRateLogicTests {
    @Test("PricingRateLogic policy calculations")
    func testPricingRateLogic() {
        let logic = PricingRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 701))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 700))
    }
}
