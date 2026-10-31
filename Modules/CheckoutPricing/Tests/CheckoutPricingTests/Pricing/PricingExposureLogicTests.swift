import CheckoutPricing
import Testing

@Suite("PricingExposureLogic")
struct PricingExposureLogicTests {
    @Test("PricingExposureLogic policy calculations")
    func testPricingExposureLogic() {
        let logic = PricingExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 726))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 725))
    }
}
