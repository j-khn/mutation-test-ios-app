import CheckoutPricing
import Testing

@Suite("DiscountsCapacityLogic")
struct DiscountsCapacityLogicTests {
    @Test("DiscountsCapacityLogic policy calculations")
    func testDiscountsCapacityLogic() {
        let logic = DiscountsCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1651))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1650))
    }
}
