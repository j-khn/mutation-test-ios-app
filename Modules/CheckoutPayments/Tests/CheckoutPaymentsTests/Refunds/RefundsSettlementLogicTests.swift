import CheckoutPayments
import Testing

@Suite("RefundsSettlementLogic")
struct RefundsSettlementLogicTests {
    @Test("RefundsSettlementLogic policy calculations")
    func testRefundsSettlementLogic() {
        let logic = RefundsSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3851))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3850))
    }
}
