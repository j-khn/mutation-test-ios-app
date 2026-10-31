import CheckoutMarketplace
import Testing

@Suite("VendorForecastLogic")
struct VendorForecastLogicTests {
    @Test("VendorForecastLogic policy calculations")
    func testVendorForecastLogic() {
        let logic = VendorForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2626))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2625))
    }
}
