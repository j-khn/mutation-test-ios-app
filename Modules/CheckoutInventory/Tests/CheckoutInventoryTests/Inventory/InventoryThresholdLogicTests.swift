import CheckoutInventory
import Testing

@Suite("InventoryThresholdLogic")
struct InventoryThresholdLogicTests {
    @Test("InventoryThresholdLogic policy calculations")
    func testInventoryThresholdLogic() {
        let logic = InventoryThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 626))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 625))
    }
}
