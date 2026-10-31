import CheckoutPayments
import Testing

@Suite("PaymentsCapacityLogic")
struct PaymentsCapacityLogicTests {
    @Test("PaymentsCapacityLogic policy calculations")
    func testPaymentsCapacityLogic() {
        let logic = PaymentsCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1401))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1400))
    }
}
