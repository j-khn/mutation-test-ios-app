import CheckoutPricing
import Testing

@Suite("PricingForecastLogic additional behavior")
struct PricingForecastLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = PricingForecastLogic()
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
    }
}
