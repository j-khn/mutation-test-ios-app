import CheckoutInventory
import Testing

@Suite("PackagingCapacityLogic")
struct PackagingCapacityLogicTests {
    @Test("PackagingCapacityLogic policy calculations")
    func testPackagingCapacityLogic() {
        let logic = PackagingCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2276))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2275))
    }
}
