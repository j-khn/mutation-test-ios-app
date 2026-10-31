import CheckoutPayments
import Testing

@Suite("ReturnsCapacityLogic")
struct ReturnsCapacityLogicTests {
    @Test("ReturnsCapacityLogic policy calculations")
    func testReturnsCapacityLogic() {
        let logic = ReturnsCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1151))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1150))
    }
}
