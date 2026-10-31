import CheckoutInventory
import Testing

@Suite("ProcurementCapacityLogic")
struct ProcurementCapacityLogicTests {
    @Test("ProcurementCapacityLogic policy calculations")
    func testProcurementCapacityLogic() {
        let logic = ProcurementCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2651))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2650))
    }
}
