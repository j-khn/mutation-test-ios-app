import CheckoutPricing
import Testing

@Suite("PricingAllocationLogic additional behavior")
struct PricingAllocationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = PricingAllocationLogic()
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
    }
}
