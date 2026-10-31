import CheckoutPricing
import Testing

@Suite("PricingCapacityLogic")
struct PricingCapacityLogicTests {
    @Test("PricingCapacityLogic policy calculations")
    func testPricingCapacityLogic() {
        let logic = PricingCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 526))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 525))
    }
}
