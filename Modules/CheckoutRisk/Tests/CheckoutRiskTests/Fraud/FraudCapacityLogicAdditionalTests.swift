import CheckoutRisk
import Testing

@Suite("FraudCapacityLogic additional behavior")
struct FraudCapacityLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = FraudCapacityLogic()
        #expect(logic.canFulfill(requested: 3, available: 3))
    }
}
