import CheckoutCustomer
import Testing

@Suite("LoyaltyAllocationLogic")
struct LoyaltyAllocationLogicTests {
    @Test("LoyaltyAllocationLogic policy calculations")
    func testLoyaltyAllocationLogic() {
        let logic = LoyaltyAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1176))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1175))
    }
}
