import CheckoutDomain
import Testing

@Suite("OrdersAllocationLogic additional behavior")
struct OrdersAllocationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = OrdersAllocationLogic()
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
    }
}
