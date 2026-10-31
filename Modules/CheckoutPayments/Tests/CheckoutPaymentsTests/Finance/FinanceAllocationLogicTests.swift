import CheckoutPayments
import Testing

@Suite("FinanceAllocationLogic")
struct FinanceAllocationLogicTests {
    @Test("FinanceAllocationLogic policy calculations")
    func testFinanceAllocationLogic() {
        let logic = FinanceAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3551))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3550))
    }
}
