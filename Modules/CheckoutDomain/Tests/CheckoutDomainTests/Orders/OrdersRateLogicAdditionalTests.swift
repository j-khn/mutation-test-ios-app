import CheckoutDomain
import Testing

@Suite("OrdersRateLogic additional behavior")
struct OrdersRateLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = OrdersRateLogic()
        #expect(logic.validRate(rateBasisPoints: 8_250))
    }
}
