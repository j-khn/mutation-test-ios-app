import CheckoutMarketplace
import Testing

@Suite("MarketplaceAllocationLogic")
struct MarketplaceAllocationLogicTests {
    @Test("MarketplaceAllocationLogic policy calculations")
    func testMarketplaceAllocationLogic() {
        let logic = MarketplaceAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
    }
}
