import CheckoutPayments
import Testing

@Suite("RefundsRateLogic")
struct RefundsRateLogicTests {
    @Test("RefundsRateLogic policy calculations")
    func testRefundsRateLogic() {
        let logic = RefundsRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3951))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3950))
    }
}
