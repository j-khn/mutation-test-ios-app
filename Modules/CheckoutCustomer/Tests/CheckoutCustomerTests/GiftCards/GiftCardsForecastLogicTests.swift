import CheckoutCustomer
import Testing

@Suite("GiftCardsForecastLogic")
struct GiftCardsForecastLogicTests {
    @Test("GiftCardsForecastLogic policy calculations")
    func testGiftCardsForecastLogic() {
        let logic = GiftCardsForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3251))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3250))
    }
}
