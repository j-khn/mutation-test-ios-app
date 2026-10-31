import CheckoutShipping
import Testing

@Suite("FulfillmentForecastLogic")
struct FulfillmentForecastLogicTests {
    @Test("FulfillmentForecastLogic policy calculations")
    func testFulfillmentForecastLogic() {
        let logic = FulfillmentForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2126))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2125))
    }
}
