import CheckoutRisk
import Testing

@Suite("FraudForecastLogic additional behavior")
struct FraudForecastLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = FraudForecastLogic()
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
    }
}
