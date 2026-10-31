import CheckoutRisk
import Testing

@Suite("RiskAllocationLogic")
struct RiskAllocationLogicTests {
    @Test("RiskAllocationLogic policy calculations")
    func testRiskAllocationLogic() {
        let logic = RiskAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3051))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3050))
    }
}
