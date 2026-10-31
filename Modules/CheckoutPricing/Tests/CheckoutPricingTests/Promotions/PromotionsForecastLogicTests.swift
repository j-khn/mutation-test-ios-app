import CheckoutPricing
import Testing

@Suite("PromotionsForecastLogic")
struct PromotionsForecastLogicTests {
    @Test("PromotionsForecastLogic policy calculations")
    func testPromotionsForecastLogic() {
        let logic = PromotionsForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1876))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1875))
    }
}
