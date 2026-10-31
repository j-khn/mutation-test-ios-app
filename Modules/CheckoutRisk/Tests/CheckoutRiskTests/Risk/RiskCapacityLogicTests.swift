import CheckoutRisk
import Testing

@Suite("RiskCapacityLogic")
struct RiskCapacityLogicTests {
    @Test("RiskCapacityLogic policy calculations")
    func testRiskCapacityLogic() {
        let logic = RiskCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2901))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2900))
    }
}
