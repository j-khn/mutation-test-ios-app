import CheckoutInventory
import Testing

@Suite("InventoryForecastLogic")
struct InventoryForecastLogicTests {
    @Test("InventoryForecastLogic policy calculations")
    func testInventoryForecastLogic() {
        let logic = InventoryForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 751))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 750))
    }
}
