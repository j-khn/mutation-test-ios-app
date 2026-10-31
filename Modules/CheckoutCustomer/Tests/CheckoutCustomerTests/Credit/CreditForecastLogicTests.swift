import CheckoutCustomer
import Testing

@Suite("CreditForecastLogic")
struct CreditForecastLogicTests {
    @Test("CreditForecastLogic policy calculations")
    func testCreditForecastLogic() {
        let logic = CreditForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3751))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3750))
    }
}
