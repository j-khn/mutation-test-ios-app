import CheckoutInventory
import Testing

@Suite("InventoryExposureLogic additional behavior")
struct InventoryExposureLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = InventoryExposureLogic()
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
    }
}
