import CheckoutDomain
import Testing

@Suite("OrdersExposureLogic additional behavior")
struct OrdersExposureLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = OrdersExposureLogic()
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
    }
}
