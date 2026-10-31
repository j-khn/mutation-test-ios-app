import CheckoutPayments
import Testing

@Suite("BillingExposureLogic additional behavior")
struct BillingExposureLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = BillingExposureLogic()
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
    }
}
