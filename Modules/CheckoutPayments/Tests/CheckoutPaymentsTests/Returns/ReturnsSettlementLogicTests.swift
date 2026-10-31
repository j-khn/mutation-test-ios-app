import CheckoutPayments
import Testing

@Suite("ReturnsSettlementLogic")
struct ReturnsSettlementLogicTests {
    @Test("ReturnsSettlementLogic policy calculations")
    func testReturnsSettlementLogic() {
        let logic = ReturnsSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1226))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1225))
    }
}
