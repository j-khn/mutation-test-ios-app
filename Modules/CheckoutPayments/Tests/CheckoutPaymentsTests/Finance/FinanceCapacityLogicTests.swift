import CheckoutPayments
import Testing

@Suite("FinanceCapacityLogic")
struct FinanceCapacityLogicTests {
    @Test("FinanceCapacityLogic policy calculations")
    func testFinanceCapacityLogic() {
        let logic = FinanceCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3401))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3400))
    }
}
