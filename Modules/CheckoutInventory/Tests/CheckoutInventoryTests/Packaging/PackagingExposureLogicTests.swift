import CheckoutInventory
import Testing

@Suite("PackagingExposureLogic")
struct PackagingExposureLogicTests {
    @Test("PackagingExposureLogic policy calculations")
    func testPackagingExposureLogic() {
        let logic = PackagingExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2476))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2475))
    }
}
