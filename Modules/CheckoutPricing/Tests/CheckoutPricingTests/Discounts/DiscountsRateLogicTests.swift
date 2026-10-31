import CheckoutPricing
import Testing

@Suite("DiscountsRateLogic")
struct DiscountsRateLogicTests {
    @Test("DiscountsRateLogic policy calculations")
    func testDiscountsRateLogic() {
        let logic = DiscountsRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1826))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1825))
    }
}
