import CheckoutDomain
import Testing

@Suite("OrdersProrationLogic additional behavior")
struct OrdersProrationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = OrdersProrationLogic()
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
    }
}
