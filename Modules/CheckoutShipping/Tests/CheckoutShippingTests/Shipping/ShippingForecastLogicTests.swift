import CheckoutShipping
import Testing

@Suite("ShippingForecastLogic")
struct ShippingForecastLogicTests {
    @Test("ShippingForecastLogic policy calculations")
    func testShippingForecastLogic() {
        let logic = ShippingForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1001))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1000))
    }
}
