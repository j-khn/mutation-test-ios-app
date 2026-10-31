import CheckoutCustomer
import Testing

@Suite("MembershipExposureLogic additional behavior")
struct MembershipExposureLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = MembershipExposureLogic()
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
    }
}
