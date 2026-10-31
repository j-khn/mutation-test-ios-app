import CheckoutRisk
import Testing

@Suite("FraudCapacityLogic")
struct FraudCapacityLogicTests {
    @Test("FraudCapacityLogic policy calculations")
    func testFraudCapacityLogic() {
        let logic = FraudCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
    }
}
