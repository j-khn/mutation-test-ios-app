import CheckoutPricing
import Testing

@Suite("PricingProrationLogic additional behavior")
struct PricingProrationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = PricingProrationLogic()
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
    }
}
