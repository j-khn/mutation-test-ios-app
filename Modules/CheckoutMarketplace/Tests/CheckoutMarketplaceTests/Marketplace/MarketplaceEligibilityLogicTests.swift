import CheckoutMarketplace
import Testing

@Suite("MarketplaceEligibilityLogic")
struct MarketplaceEligibilityLogicTests {
    @Test("MarketplaceEligibilityLogic policy calculations")
    func testMarketplaceEligibilityLogic() {
        let logic = MarketplaceEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
    }
}
