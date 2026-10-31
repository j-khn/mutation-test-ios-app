import CheckoutMarketplace
import Testing

@Suite("VendorCapacityLogic")
struct VendorCapacityLogicTests {
    @Test("VendorCapacityLogic policy calculations")
    func testVendorCapacityLogic() {
        let logic = VendorCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2526))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2525))
    }
}
