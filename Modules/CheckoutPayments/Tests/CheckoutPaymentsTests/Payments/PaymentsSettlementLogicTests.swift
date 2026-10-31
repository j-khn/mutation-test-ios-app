import CheckoutPayments
import Testing

@Suite("PaymentsSettlementLogic")
struct PaymentsSettlementLogicTests {
    @Test("PaymentsSettlementLogic policy calculations")
    func testPaymentsSettlementLogic() {
        let logic = PaymentsSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1476))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1475))
    }
}
