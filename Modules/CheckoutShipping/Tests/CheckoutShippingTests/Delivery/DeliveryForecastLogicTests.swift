import CheckoutShipping
import Testing

@Suite("DeliveryForecastLogic")
struct DeliveryForecastLogicTests {
    @Test("DeliveryForecastLogic policy calculations")
    func testDeliveryForecastLogic() {
        let logic = DeliveryForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
    }
}
