import CheckoutPricing
import Testing

@Suite("PromotionsSettlementLogic")
struct PromotionsSettlementLogicTests {
    @Test("PromotionsSettlementLogic policy calculations")
    func testPromotionsSettlementLogic() {
        let logic = PromotionsSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1851))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1850))
    }
}
