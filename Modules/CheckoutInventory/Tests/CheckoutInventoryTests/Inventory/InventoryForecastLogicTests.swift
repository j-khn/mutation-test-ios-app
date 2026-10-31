import CheckoutInventory
import Testing

@Suite("InventoryForecastLogic")
struct InventoryForecastLogicTests {
    @Test("InventoryForecastLogic policy calculations")
    func testInventoryForecastLogic() {
        let logic = InventoryForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
    }
}
