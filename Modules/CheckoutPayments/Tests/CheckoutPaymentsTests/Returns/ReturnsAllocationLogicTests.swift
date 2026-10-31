import CheckoutPayments
import Testing

@Suite("ReturnsAllocationLogic")
struct ReturnsAllocationLogicTests {
    @Test("ReturnsAllocationLogic policy calculations")
    func testReturnsAllocationLogic() {
        let logic = ReturnsAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1301))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1300))
    }
}
