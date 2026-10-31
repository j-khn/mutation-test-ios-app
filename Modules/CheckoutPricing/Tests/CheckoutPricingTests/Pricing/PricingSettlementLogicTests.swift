import CheckoutPricing
import Testing

@Suite("PricingSettlementLogic")
struct PricingSettlementLogicTests {
    @Test("PricingSettlementLogic policy calculations")
    func testPricingSettlementLogic() {
        let logic = PricingSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
    }
}
