import CheckoutPricing
import Testing

@Suite("DiscountsForecastLogic")
struct DiscountsForecastLogicTests {
    @Test("DiscountsForecastLogic policy calculations")
    func testDiscountsForecastLogic() {
        let logic = DiscountsForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1751))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1750))
    }
}
