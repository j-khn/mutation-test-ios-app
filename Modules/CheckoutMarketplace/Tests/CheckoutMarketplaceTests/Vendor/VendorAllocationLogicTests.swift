import CheckoutMarketplace
import Testing

@Suite("VendorAllocationLogic")
struct VendorAllocationLogicTests {
    @Test("VendorAllocationLogic policy calculations")
    func testVendorAllocationLogic() {
        let logic = VendorAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2676))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2675))
    }
}
