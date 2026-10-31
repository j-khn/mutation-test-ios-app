import CheckoutPayments
import Testing

@Suite("PaymentsForecastLogic")
struct PaymentsForecastLogicTests {
    @Test("PaymentsForecastLogic policy calculations")
    func testPaymentsForecastLogic() {
        let logic = PaymentsForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1501))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1500))
    }
}
