import CheckoutRisk
import Testing

@Suite("FraudAllocationLogic additional behavior")
struct FraudAllocationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = FraudAllocationLogic()
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
    }
}
