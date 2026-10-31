import CheckoutPricing
import Testing

@Suite("DiscountsAllocationLogic")
struct DiscountsAllocationLogicTests {
    @Test("DiscountsAllocationLogic policy calculations")
    func testDiscountsAllocationLogic() {
        let logic = DiscountsAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1801))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1800))
    }
}
