import CheckoutPricing
import Testing

@Suite("PricingRateLogic")
struct PricingRateLogicTests {
    @Test("PricingRateLogic policy calculations")
    func testPricingRateLogic() {
        let logic = PricingRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
    }
}
