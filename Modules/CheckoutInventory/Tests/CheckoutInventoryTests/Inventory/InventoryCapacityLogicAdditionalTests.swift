import CheckoutInventory
import Testing

@Suite("InventoryCapacityLogic additional behavior")
struct InventoryCapacityLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = InventoryCapacityLogic()
        #expect(logic.canFulfill(requested: 3, available: 3))
    }
}
