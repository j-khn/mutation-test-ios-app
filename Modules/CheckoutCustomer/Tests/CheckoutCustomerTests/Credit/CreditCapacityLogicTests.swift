import CheckoutCustomer
import Testing

@Suite("CreditCapacityLogic")
struct CreditCapacityLogicTests {
    @Test("CreditCapacityLogic policy calculations")
    func testCreditCapacityLogic() {
        let logic = CreditCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3651))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3650))
    }
}
