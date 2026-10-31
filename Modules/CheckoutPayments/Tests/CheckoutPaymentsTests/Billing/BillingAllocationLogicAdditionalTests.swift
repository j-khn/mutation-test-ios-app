import CheckoutPayments
import Testing

@Suite("BillingAllocationLogic additional behavior")
struct BillingAllocationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = BillingAllocationLogic()
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
    }
}
