import CheckoutShipping
import Testing

@Suite("DeliveryProrationLogic additional behavior")
struct DeliveryProrationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = DeliveryProrationLogic()
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
    }
}
