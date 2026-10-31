import CheckoutMarketplace
import Testing

@Suite("MarketplaceCapacityLogic")
struct MarketplaceCapacityLogicTests {
    @Test("MarketplaceCapacityLogic policy calculations")
    func testMarketplaceCapacityLogic() {
        let logic = MarketplaceCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
    }
}
