import CheckoutDomain
import Testing

@Suite("OrdersSettlementLogic")
struct OrdersSettlementLogicTests {
    @Test("OrdersSettlementLogic policy calculations")
    func testOrdersSettlementLogic() {
        let logic = OrdersSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1976))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1975))
    }
}
