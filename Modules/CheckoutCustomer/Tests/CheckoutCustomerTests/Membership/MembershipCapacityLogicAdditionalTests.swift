import CheckoutCustomer
import Testing

@Suite("MembershipCapacityLogic additional behavior")
struct MembershipCapacityLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = MembershipCapacityLogic()
        #expect(logic.canFulfill(requested: 3, available: 3))
    }
}
