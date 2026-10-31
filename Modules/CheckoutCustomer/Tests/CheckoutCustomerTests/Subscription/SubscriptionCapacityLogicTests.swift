import CheckoutCustomer
import Testing

@Suite("SubscriptionCapacityLogic")
struct SubscriptionCapacityLogicTests {
    @Test("SubscriptionCapacityLogic policy calculations")
    func testSubscriptionCapacityLogic() {
        let logic = SubscriptionCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1276))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1275))
    }
}
