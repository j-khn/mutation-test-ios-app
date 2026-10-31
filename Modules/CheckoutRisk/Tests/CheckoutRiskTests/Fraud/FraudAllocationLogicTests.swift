import CheckoutRisk
import Testing

@Suite("FraudAllocationLogic")
struct FraudAllocationLogicTests {
    @Test("FraudAllocationLogic policy calculations")
    func testFraudAllocationLogic() {
        let logic = FraudAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2926))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2925))
    }
}
