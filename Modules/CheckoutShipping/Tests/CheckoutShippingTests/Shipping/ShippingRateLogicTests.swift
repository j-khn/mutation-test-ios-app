import CheckoutShipping
import Testing

@Suite("ShippingRateLogic")
struct ShippingRateLogicTests {
    @Test("ShippingRateLogic policy calculations")
    func testShippingRateLogic() {
        let logic = ShippingRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1076))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1075))
    }
}
