import CheckoutShipping
import Testing

@Suite("DeliveryExposureLogic additional behavior")
struct DeliveryExposureLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = DeliveryExposureLogic()
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
    }
}
