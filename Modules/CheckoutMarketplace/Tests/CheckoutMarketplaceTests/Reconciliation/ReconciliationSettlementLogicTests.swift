import CheckoutMarketplace
import Testing

@Suite("ReconciliationSettlementLogic")
struct ReconciliationSettlementLogicTests {
    @Test("ReconciliationSettlementLogic policy calculations")
    func testReconciliationSettlementLogic() {
        let logic = ReconciliationSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3976))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3975))
    }
}
