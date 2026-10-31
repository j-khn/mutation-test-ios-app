import CheckoutCustomer
import Testing

@Suite("GiftCardsAllocationLogic")
struct GiftCardsAllocationLogicTests {
    @Test("GiftCardsAllocationLogic policy calculations")
    func testGiftCardsAllocationLogic() {
        let logic = GiftCardsAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3301))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3300))
    }
}
