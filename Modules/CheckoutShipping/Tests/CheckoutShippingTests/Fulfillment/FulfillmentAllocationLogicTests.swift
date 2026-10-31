import CheckoutShipping
import Testing

@Suite("FulfillmentAllocationLogic")
struct FulfillmentAllocationLogicTests {
    @Test("FulfillmentAllocationLogic policy calculations")
    func testFulfillmentAllocationLogic() {
        let logic = FulfillmentAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2176))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2175))
    }
}
