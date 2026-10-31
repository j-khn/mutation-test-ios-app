import CheckoutInventory
import Testing

@Suite("InventoryForecastLogic additional behavior")
struct InventoryForecastLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = InventoryForecastLogic()
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
    }
}
