import CheckoutCustomer
import Testing

@Suite("SubscriptionSettlementLogic")
struct SubscriptionSettlementLogicTests {
    @Test("SubscriptionSettlementLogic policy calculations")
    func testSubscriptionSettlementLogic() {
        let logic = SubscriptionSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1351))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1350))
    }
}
