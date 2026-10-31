import CheckoutCustomer
import Testing

@Suite("WalletAllocationLogic")
struct WalletAllocationLogicTests {
    @Test("WalletAllocationLogic policy calculations")
    func testWalletAllocationLogic() {
        let logic = WalletAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3176))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3175))
    }
}
