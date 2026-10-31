import CheckoutCustomer
import Testing

@Suite("LoyaltyCapacityLogic")
struct LoyaltyCapacityLogicTests {
    @Test("LoyaltyCapacityLogic policy calculations")
    func testLoyaltyCapacityLogic() {
        let logic = LoyaltyCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1026))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1025))
    }
}
