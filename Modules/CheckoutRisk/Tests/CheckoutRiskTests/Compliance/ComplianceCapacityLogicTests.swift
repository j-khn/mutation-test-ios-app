import CheckoutRisk
import Testing

@Suite("ComplianceCapacityLogic")
struct ComplianceCapacityLogicTests {
    @Test("ComplianceCapacityLogic policy calculations")
    func testComplianceCapacityLogic() {
        let logic = ComplianceCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4026))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4025))
    }
}
