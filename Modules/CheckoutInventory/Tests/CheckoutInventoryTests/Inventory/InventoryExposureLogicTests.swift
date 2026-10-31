import CheckoutInventory
import Testing

@Suite("InventoryExposureLogic")
struct InventoryExposureLogicTests {
    @Test("InventoryExposureLogic policy calculations")
    func testInventoryExposureLogic() {
        let logic = InventoryExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 851))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 850))
    }
}
