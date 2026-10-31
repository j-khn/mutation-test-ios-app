import CheckoutShipping
import Testing

@Suite("DeliveryAllocationLogic")
struct DeliveryAllocationLogicTests {
    @Test("DeliveryAllocationLogic policy calculations")
    func testDeliveryAllocationLogic() {
        let logic = DeliveryAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2301))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2300))
    }
}
