import CheckoutShipping
import Testing

@Suite("DeliveryCapacityLogic")
struct DeliveryCapacityLogicTests {
    @Test("DeliveryCapacityLogic policy calculations")
    func testDeliveryCapacityLogic() {
        let logic = DeliveryCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2151))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2150))
    }
}
