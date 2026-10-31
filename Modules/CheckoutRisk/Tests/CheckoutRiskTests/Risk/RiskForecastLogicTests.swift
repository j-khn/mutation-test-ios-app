import CheckoutRisk
import Testing

@Suite("RiskForecastLogic")
struct RiskForecastLogicTests {
    @Test("RiskForecastLogic policy calculations")
    func testRiskForecastLogic() {
        let logic = RiskForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3001))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3000))
    }
}
