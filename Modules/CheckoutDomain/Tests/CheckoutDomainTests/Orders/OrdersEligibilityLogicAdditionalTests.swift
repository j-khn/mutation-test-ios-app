import CheckoutDomain
import Testing

@Suite("OrdersEligibilityLogic additional behavior")
struct OrdersEligibilityLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = OrdersEligibilityLogic()
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
    }
}
