import CheckoutPayments
import Testing

@Suite("ReturnsForecastLogic")
struct ReturnsForecastLogicTests {
    @Test("ReturnsForecastLogic policy calculations")
    func testReturnsForecastLogic() {
        let logic = ReturnsForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1251))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1250))
    }
}
