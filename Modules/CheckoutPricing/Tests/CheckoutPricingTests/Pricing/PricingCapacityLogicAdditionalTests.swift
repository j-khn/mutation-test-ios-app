import CheckoutPricing
import Testing

@Suite("PricingCapacityLogic additional behavior")
struct PricingCapacityLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = PricingCapacityLogic()
        #expect(logic.canFulfill(requested: 3, available: 3))
    }
}
