import CheckoutCustomer
import Testing

@Suite("MembershipAllocationLogic additional behavior")
struct MembershipAllocationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = MembershipAllocationLogic()
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
    }
}
