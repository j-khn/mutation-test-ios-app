import CheckoutShipping
import Testing

@Suite("ShippingExposureLogic")
struct ShippingExposureLogicTests {
    @Test("ShippingExposureLogic policy calculations")
    func testShippingExposureLogic() {
        let logic = ShippingExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1101))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1100))
    }
}
