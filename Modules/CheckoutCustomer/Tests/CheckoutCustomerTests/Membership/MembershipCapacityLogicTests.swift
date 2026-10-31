import CheckoutCustomer
import Testing

@Suite("MembershipCapacityLogic")
struct MembershipCapacityLogicTests {
    @Test("MembershipCapacityLogic policy calculations")
    func testMembershipCapacityLogic() {
        let logic = MembershipCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3276))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3275))
    }
}
