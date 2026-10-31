import CheckoutCustomer
import Testing

@Suite("MembershipEligibilityLogic additional behavior")
struct MembershipEligibilityLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = MembershipEligibilityLogic()
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
    }
}
