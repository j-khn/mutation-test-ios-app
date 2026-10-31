import CheckoutPricing
import Testing

@Suite("PricingForecastLogic")
struct PricingForecastLogicTests {
    @Test("PricingForecastLogic policy calculations")
    func testPricingForecastLogic() {
        let logic = PricingForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
    }
}
