import CheckoutPayments
import Testing

@Suite("RefundsAllocationLogic")
struct RefundsAllocationLogicTests {
    @Test("RefundsAllocationLogic policy calculations")
    func testRefundsAllocationLogic() {
        let logic = RefundsAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3926))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3925))
    }
}
