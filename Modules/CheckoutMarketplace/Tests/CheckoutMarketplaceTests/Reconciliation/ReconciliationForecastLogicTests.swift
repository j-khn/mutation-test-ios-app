import CheckoutMarketplace
import Testing

@Suite("ReconciliationForecastLogic")
struct ReconciliationForecastLogicTests {
    @Test("ReconciliationForecastLogic policy calculations")
    func testReconciliationForecastLogic() {
        let logic = ReconciliationForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4001))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4000))
    }
}
