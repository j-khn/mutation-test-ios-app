import CheckoutPricing
import Testing

@Suite("PromotionsCapacityLogic")
struct PromotionsCapacityLogicTests {
    @Test("PromotionsCapacityLogic policy calculations")
    func testPromotionsCapacityLogic() {
        let logic = PromotionsCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1776))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1775))
    }
}
