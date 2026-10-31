import CheckoutCustomer
import Testing

@Suite("SubscriptionForecastLogic")
struct SubscriptionForecastLogicTests {
    @Test("SubscriptionForecastLogic policy calculations")
    func testSubscriptionForecastLogic() {
        let logic = SubscriptionForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1376))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1375))
    }
}
