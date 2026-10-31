import CheckoutPayments
import Testing

@Suite("BillingAllocationLogic")
struct BillingAllocationLogicTests {
    @Test("BillingAllocationLogic policy calculations")
    func testBillingAllocationLogic() {
        let logic = BillingAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
    }
}
