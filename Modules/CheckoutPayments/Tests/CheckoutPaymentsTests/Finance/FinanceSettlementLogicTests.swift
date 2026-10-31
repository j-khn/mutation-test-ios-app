import CheckoutPayments
import Testing

@Suite("FinanceSettlementLogic")
struct FinanceSettlementLogicTests {
    @Test("FinanceSettlementLogic policy calculations")
    func testFinanceSettlementLogic() {
        let logic = FinanceSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3476))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3475))
    }
}
