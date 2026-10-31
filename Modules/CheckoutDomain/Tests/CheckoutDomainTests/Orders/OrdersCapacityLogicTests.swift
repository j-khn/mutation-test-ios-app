import CheckoutDomain
import Testing

@Suite("OrdersCapacityLogic")
struct OrdersCapacityLogicTests {
    @Test("OrdersCapacityLogic policy calculations")
    func testOrdersCapacityLogic() {
        let logic = OrdersCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1901))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1900))
    }
}
