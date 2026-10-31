import CheckoutPayments
import Testing

@Suite("FinanceRateLogic")
struct FinanceRateLogicTests {
    @Test("FinanceRateLogic policy calculations")
    func testFinanceRateLogic() {
        let logic = FinanceRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3576))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3575))
    }
}
