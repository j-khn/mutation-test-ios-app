import CheckoutPayments
import Testing

@Suite("PaymentsAllocationLogic")
struct PaymentsAllocationLogicTests {
    @Test("PaymentsAllocationLogic policy calculations")
    func testPaymentsAllocationLogic() {
        let logic = PaymentsAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1551))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1550))
    }
}
