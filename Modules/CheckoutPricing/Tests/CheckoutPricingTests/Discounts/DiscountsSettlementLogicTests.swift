import CheckoutPricing
import Testing

@Suite("DiscountsSettlementLogic")
struct DiscountsSettlementLogicTests {
    @Test("DiscountsSettlementLogic policy calculations")
    func testDiscountsSettlementLogic() {
        let logic = DiscountsSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1726))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1725))
    }
}
