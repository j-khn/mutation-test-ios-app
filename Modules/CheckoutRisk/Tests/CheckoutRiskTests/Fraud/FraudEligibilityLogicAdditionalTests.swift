import CheckoutRisk
import Testing

@Suite("FraudEligibilityLogic additional behavior")
struct FraudEligibilityLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = FraudEligibilityLogic()
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
    }
}
