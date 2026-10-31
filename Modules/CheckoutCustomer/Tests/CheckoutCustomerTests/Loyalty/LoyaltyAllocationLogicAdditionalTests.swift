import CheckoutCustomer
import Testing

@Suite("LoyaltyAllocationLogic additional behavior")
struct LoyaltyAllocationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = LoyaltyAllocationLogic()
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
    }
}
