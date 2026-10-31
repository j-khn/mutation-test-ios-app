import CheckoutPayments
import Testing

@Suite("InvoicesAllocationLogic")
struct InvoicesAllocationLogicTests {
    @Test("InvoicesAllocationLogic policy calculations")
    func testInvoicesAllocationLogic() {
        let logic = InvoicesAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3676))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3675))
    }
}
