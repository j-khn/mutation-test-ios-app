import CheckoutDomain
import Testing

@Suite("OrdersForecastLogic")
struct OrdersForecastLogicTests {
    @Test("OrdersForecastLogic policy calculations")
    func testOrdersForecastLogic() {
        let logic = OrdersForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2001))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2000))
    }
}
