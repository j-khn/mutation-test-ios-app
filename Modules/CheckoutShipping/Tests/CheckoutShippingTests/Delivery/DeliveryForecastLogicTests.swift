import CheckoutShipping
import Testing

@Suite("DeliveryForecastLogic")
struct DeliveryForecastLogicTests {
    @Test("DeliveryForecastLogic policy calculations")
    func testDeliveryForecastLogic() {
        let logic = DeliveryForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2251))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2250))
    }
}
