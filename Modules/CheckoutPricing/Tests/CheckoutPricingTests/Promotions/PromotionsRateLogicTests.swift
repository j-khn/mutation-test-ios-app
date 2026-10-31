import CheckoutPricing
import Testing

@Suite("PromotionsRateLogic")
struct PromotionsRateLogicTests {
    @Test("PromotionsRateLogic policy calculations")
    func testPromotionsRateLogic() {
        let logic = PromotionsRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1951))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1950))
    }
}
