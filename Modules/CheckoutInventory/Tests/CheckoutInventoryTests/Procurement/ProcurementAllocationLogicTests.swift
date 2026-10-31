import CheckoutInventory
import Testing

@Suite("ProcurementAllocationLogic")
struct ProcurementAllocationLogicTests {
    @Test("ProcurementAllocationLogic policy calculations")
    func testProcurementAllocationLogic() {
        let logic = ProcurementAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2801))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2800))
    }
}
