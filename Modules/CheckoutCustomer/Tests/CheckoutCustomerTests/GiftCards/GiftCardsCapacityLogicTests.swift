import CheckoutCustomer
import Testing

@Suite("GiftCardsCapacityLogic")
struct GiftCardsCapacityLogicTests {
    @Test("GiftCardsCapacityLogic policy calculations")
    func testGiftCardsCapacityLogic() {
        let logic = GiftCardsCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3151))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3150))
    }
}
