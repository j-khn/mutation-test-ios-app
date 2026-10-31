import CheckoutPricing
import Testing

@Suite("PromotionsExposureLogic")
struct PromotionsExposureLogicTests {
    @Test("PromotionsExposureLogic policy calculations")
    func testPromotionsExposureLogic() {
        let logic = PromotionsExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1976))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1975))
    }
}
