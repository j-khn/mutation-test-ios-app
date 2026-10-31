import CheckoutPricing
import Testing

@Suite("PricingAllocationLogic")
struct PricingAllocationLogicTests {
    @Test("PricingAllocationLogic policy calculations")
    func testPricingAllocationLogic() {
        let logic = PricingAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 676))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 675))
    }
}
