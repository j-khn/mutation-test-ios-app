import CheckoutShipping
import Testing

@Suite("FulfillmentRateLogic")
struct FulfillmentRateLogicTests {
    @Test("FulfillmentRateLogic policy calculations")
    func testFulfillmentRateLogic() {
        let logic = FulfillmentRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2201))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2200))
    }
}
