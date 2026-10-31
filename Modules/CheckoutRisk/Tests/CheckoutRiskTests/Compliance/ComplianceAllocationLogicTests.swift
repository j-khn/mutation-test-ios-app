import CheckoutRisk
import Testing

@Suite("ComplianceAllocationLogic")
struct ComplianceAllocationLogicTests {
    @Test("ComplianceAllocationLogic policy calculations")
    func testComplianceAllocationLogic() {
        let logic = ComplianceAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4176))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4175))
    }
}
