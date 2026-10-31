import CheckoutPricing
import Testing

@Suite("TaxForecastLogic")
struct TaxForecastLogicTests {
    @Test("TaxForecastLogic policy calculations")
    func testTaxForecastLogic() {
        let logic = TaxForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1626))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1625))
    }
}
