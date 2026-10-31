import CheckoutInventory
import Testing

@Suite("InventoryAllocationLogic additional behavior")
struct InventoryAllocationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = InventoryAllocationLogic()
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
    }
}
