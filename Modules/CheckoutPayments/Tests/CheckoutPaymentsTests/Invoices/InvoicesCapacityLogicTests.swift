import CheckoutPayments
import Testing

@Suite("InvoicesCapacityLogic")
struct InvoicesCapacityLogicTests {
    @Test("InvoicesCapacityLogic policy calculations")
    func testInvoicesCapacityLogic() {
        let logic = InvoicesCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3526))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3525))
    }
}
