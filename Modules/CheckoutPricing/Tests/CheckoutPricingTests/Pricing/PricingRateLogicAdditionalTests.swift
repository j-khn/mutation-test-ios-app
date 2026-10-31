import CheckoutPricing
import Testing

@Suite("PricingRateLogic additional behavior")
struct PricingRateLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = PricingRateLogic()
        #expect(logic.validRate(rateBasisPoints: 8_250))
    }
}
