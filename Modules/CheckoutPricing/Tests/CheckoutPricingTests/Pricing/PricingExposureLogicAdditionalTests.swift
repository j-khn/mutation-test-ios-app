import CheckoutPricing
import Testing

@Suite("PricingExposureLogic additional behavior")
struct PricingExposureLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = PricingExposureLogic()
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
    }
}
