import CheckoutMarketplace
import Testing

@Suite("MarketplaceForecastLogic")
struct MarketplaceForecastLogicTests {
    @Test("MarketplaceForecastLogic policy calculations")
    func testMarketplaceForecastLogic() {
        let logic = MarketplaceForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2501))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2500))
    }
}
