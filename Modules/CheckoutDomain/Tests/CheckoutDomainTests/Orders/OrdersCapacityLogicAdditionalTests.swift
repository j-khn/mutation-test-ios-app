import CheckoutDomain
import Testing

@Suite("OrdersCapacityLogic additional behavior")
struct OrdersCapacityLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = OrdersCapacityLogic()
        #expect(logic.canFulfill(requested: 3, available: 3))
    }
}
