import CheckoutInventory
import Testing

@Suite("InventoryAllocationLogic")
struct InventoryAllocationLogicTests {
    @Test("InventoryAllocationLogic policy calculations")
    func testInventoryAllocationLogic() {
        let logic = InventoryAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 801))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 800))
    }
}
