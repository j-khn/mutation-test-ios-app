import CheckoutShipping
import Testing

@Suite("FulfillmentSettlementLogic")
struct FulfillmentSettlementLogicTests {
    @Test("FulfillmentSettlementLogic policy calculations")
    func testFulfillmentSettlementLogic() {
        let logic = FulfillmentSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2101))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2100))
    }
}
