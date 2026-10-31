import CheckoutInventory
import Testing

@Suite("InventoryRateLogic additional behavior")
struct InventoryRateLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = InventoryRateLogic()
        #expect(logic.validRate(rateBasisPoints: 8_250))
    }
}
