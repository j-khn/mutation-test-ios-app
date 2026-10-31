import CheckoutInventory
import Testing

@Suite("InventoryProrationLogic additional behavior")
struct InventoryProrationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = InventoryProrationLogic()
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
    }
}
