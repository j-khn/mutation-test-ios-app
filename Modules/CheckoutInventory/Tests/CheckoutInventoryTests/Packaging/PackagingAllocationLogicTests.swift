import CheckoutInventory
import Testing

@Suite("PackagingAllocationLogic")
struct PackagingAllocationLogicTests {
    @Test("PackagingAllocationLogic policy calculations")
    func testPackagingAllocationLogic() {
        let logic = PackagingAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
    }
}
