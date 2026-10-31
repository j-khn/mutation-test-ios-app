import CheckoutCustomer
import Testing

@Suite("MembershipForecastLogic additional behavior")
struct MembershipForecastLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = MembershipForecastLogic()
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
    }
}
