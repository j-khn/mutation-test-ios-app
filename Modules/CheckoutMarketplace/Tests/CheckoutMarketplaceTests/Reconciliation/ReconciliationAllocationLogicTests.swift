import CheckoutMarketplace
import Testing

@Suite("ReconciliationAllocationLogic")
struct ReconciliationAllocationLogicTests {
    @Test("ReconciliationAllocationLogic policy calculations")
    func testReconciliationAllocationLogic() {
        let logic = ReconciliationAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4051))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4050))
    }
}
