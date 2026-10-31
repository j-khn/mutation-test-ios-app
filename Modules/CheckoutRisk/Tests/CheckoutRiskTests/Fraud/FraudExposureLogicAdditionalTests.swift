import CheckoutRisk
import Testing

@Suite("FraudExposureLogic additional behavior")
struct FraudExposureLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = FraudExposureLogic()
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
    }
}
