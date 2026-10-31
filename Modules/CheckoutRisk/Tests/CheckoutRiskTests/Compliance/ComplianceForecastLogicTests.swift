import CheckoutRisk
import Testing

@Suite("ComplianceForecastLogic")
struct ComplianceForecastLogicTests {
    @Test("ComplianceForecastLogic policy calculations")
    func testComplianceForecastLogic() {
        let logic = ComplianceForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4126))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4125))
    }
}
