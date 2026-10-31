import CheckoutPayments
import Testing

@Suite("BillingRateLogic additional behavior")
struct BillingRateLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = BillingRateLogic()
        #expect(logic.validRate(rateBasisPoints: 8_250))
    }
}
