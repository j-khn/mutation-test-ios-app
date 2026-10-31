import CheckoutPayments
import Testing

@Suite("ReturnsRateLogic")
struct ReturnsRateLogicTests {
    @Test("ReturnsRateLogic policy calculations")
    func testReturnsRateLogic() {
        let logic = ReturnsRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1326))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1325))
    }
}
