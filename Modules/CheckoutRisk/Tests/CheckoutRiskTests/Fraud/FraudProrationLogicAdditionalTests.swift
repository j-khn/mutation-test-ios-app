import CheckoutRisk
import Testing

@Suite("FraudProrationLogic additional behavior")
struct FraudProrationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = FraudProrationLogic()
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
    }
}
