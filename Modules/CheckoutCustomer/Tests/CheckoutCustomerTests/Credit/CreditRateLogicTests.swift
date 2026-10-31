import CheckoutCustomer
import Testing

@Suite("CreditRateLogic")
struct CreditRateLogicTests {
    @Test("CreditRateLogic policy calculations")
    func testCreditRateLogic() {
        let logic = CreditRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3826))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3825))
    }
}
