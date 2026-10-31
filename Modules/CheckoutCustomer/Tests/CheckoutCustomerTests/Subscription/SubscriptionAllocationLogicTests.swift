import CheckoutCustomer
import Testing

@Suite("SubscriptionAllocationLogic")
struct SubscriptionAllocationLogicTests {
    @Test("SubscriptionAllocationLogic policy calculations")
    func testSubscriptionAllocationLogic() {
        let logic = SubscriptionAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1426))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1425))
    }
}
