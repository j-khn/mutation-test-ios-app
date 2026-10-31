import CheckoutPayments
import Testing

@Suite("BillingForecastLogic")
struct BillingForecastLogicTests {
    @Test("BillingForecastLogic policy calculations")
    func testBillingForecastLogic() {
        let logic = BillingForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
    }
}
