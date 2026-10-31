import CheckoutInventory
import Testing

@Suite("InventoryRateLogic")
struct InventoryRateLogicTests {
    @Test("InventoryRateLogic policy calculations")
    func testInventoryRateLogic() {
        let logic = InventoryRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 826))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 825))
    }
}
