import CheckoutMarketplace
import Testing

@Suite("MarketplaceSettlementLogic")
struct MarketplaceSettlementLogicTests {
    @Test("MarketplaceSettlementLogic policy calculations")
    func testMarketplaceSettlementLogic() {
        let logic = MarketplaceSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2476))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2475))
    }
}
