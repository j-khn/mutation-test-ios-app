import CheckoutMarketplace
import Testing

@Suite("VendorExposureLogic")
struct VendorExposureLogicTests {
    @Test("VendorExposureLogic policy calculations")
    func testVendorExposureLogic() {
        let logic = VendorExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2726))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2725))
    }
}
