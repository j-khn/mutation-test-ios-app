import CheckoutPayments
import Testing

@Suite("RefundsCapacityLogic")
struct RefundsCapacityLogicTests {
    @Test("RefundsCapacityLogic policy calculations")
    func testRefundsCapacityLogic() {
        let logic = RefundsCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3776))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3775))
    }
}
