import CheckoutPayments
import Testing

@Suite("BillingCapacityLogic")
struct BillingCapacityLogicTests {
    @Test("BillingCapacityLogic policy calculations")
    func testBillingCapacityLogic() {
        let logic = BillingCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
    }
}
