import CheckoutMarketplace
import Testing

@Suite("ReconciliationCapacityLogic")
struct ReconciliationCapacityLogicTests {
    @Test("ReconciliationCapacityLogic policy calculations")
    func testReconciliationCapacityLogic() {
        let logic = ReconciliationCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3901))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3900))
    }
}
