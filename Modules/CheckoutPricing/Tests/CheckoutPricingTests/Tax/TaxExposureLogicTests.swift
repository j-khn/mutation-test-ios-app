import CheckoutPricing
import Testing

@Suite("TaxExposureLogic")
struct TaxExposureLogicTests {
    @Test("TaxExposureLogic policy calculations")
    func testTaxExposureLogic() {
        let logic = TaxExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1726))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1725))
    }
}
