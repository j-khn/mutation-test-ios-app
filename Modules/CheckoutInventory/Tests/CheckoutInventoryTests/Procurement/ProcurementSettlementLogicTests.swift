import CheckoutInventory
import Testing

@Suite("ProcurementSettlementLogic")
struct ProcurementSettlementLogicTests {
    @Test("ProcurementSettlementLogic policy calculations")
    func testProcurementSettlementLogic() {
        let logic = ProcurementSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2726))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2725))
    }
}
