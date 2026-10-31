import CheckoutPayments
import Testing

@Suite("BillingForecastLogic additional behavior")
struct BillingForecastLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = BillingForecastLogic()
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
    }
}
