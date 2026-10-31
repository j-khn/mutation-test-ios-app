import CheckoutShipping
import Testing

@Suite("ShippingCapacityLogic")
struct ShippingCapacityLogicTests {
    @Test("ShippingCapacityLogic policy calculations")
    func testShippingCapacityLogic() {
        let logic = ShippingCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 901))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 900))
    }
}
