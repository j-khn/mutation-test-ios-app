import CheckoutInventory
import Testing

@Suite("InventoryCapacityLogic")
struct InventoryCapacityLogicTests {
    @Test("InventoryCapacityLogic policy calculations")
    func testInventoryCapacityLogic() {
        let logic = InventoryCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
    }
}
