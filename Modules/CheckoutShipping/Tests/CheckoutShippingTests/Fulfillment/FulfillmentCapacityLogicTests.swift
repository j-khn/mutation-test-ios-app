import CheckoutShipping
import Testing

@Suite("FulfillmentCapacityLogic")
struct FulfillmentCapacityLogicTests {
    @Test("FulfillmentCapacityLogic policy calculations")
    func testFulfillmentCapacityLogic() {
        let logic = FulfillmentCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2026))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2025))
    }
}
