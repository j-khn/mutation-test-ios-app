import CheckoutRisk
import Testing

@Suite("ComplianceSettlementLogic")
struct ComplianceSettlementLogicTests {
    @Test("ComplianceSettlementLogic policy calculations")
    func testComplianceSettlementLogic() {
        let logic = ComplianceSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4101))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4100))
    }
}
