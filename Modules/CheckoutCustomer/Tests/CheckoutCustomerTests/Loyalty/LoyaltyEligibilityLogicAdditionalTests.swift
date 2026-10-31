import CheckoutCustomer
import Testing

@Suite("LoyaltyEligibilityLogic additional behavior")
struct LoyaltyEligibilityLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = LoyaltyEligibilityLogic()
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
    }
}
