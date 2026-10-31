import CheckoutPayments
import Testing

@Suite("BillingSettlementLogic")
struct BillingSettlementLogicTests {
    @Test("BillingSettlementLogic policy calculations")
    func testBillingSettlementLogic() {
        let logic = BillingSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 851))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 850))
    }
}
