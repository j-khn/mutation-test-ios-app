import CheckoutMarketplace
import Testing

@Suite("ReconciliationRateLogic")
struct ReconciliationRateLogicTests {
    @Test("ReconciliationRateLogic policy calculations")
    func testReconciliationRateLogic() {
        let logic = ReconciliationRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4076))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4075))
    }
}
