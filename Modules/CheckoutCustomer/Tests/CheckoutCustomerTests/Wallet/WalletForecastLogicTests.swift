import CheckoutCustomer
import Testing

@Suite("WalletForecastLogic")
struct WalletForecastLogicTests {
    @Test("WalletForecastLogic policy calculations")
    func testWalletForecastLogic() {
        let logic = WalletForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3126))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3125))
    }
}
