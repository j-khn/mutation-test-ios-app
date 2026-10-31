import CheckoutPayments
import Testing

@Suite("BillingProrationLogic additional behavior")
struct BillingProrationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = BillingProrationLogic()
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
    }
}
