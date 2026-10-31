import CheckoutPayments
import Testing

@Suite("BillingForecastLogic")
struct BillingForecastLogicTests {
    @Test("BillingForecastLogic policy calculations")
    func testBillingForecastLogic() {
        let logic = BillingForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 876))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 875))
    }
}
