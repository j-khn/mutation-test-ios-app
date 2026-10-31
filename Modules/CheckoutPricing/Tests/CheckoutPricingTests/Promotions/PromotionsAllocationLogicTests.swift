import CheckoutPricing
import Testing

@Suite("PromotionsAllocationLogic")
struct PromotionsAllocationLogicTests {
    @Test("PromotionsAllocationLogic policy calculations")
    func testPromotionsAllocationLogic() {
        let logic = PromotionsAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1926))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1925))
    }
}
