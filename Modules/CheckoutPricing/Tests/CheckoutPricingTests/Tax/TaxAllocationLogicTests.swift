import CheckoutPricing
import Testing

@Suite("TaxAllocationLogic")
struct TaxAllocationLogicTests {
    @Test("TaxAllocationLogic policy calculations")
    func testTaxAllocationLogic() {
        let logic = TaxAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1676))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1675))
    }
}
