import CheckoutPricing
import Testing

@Suite("DiscountsExposureLogic")
struct DiscountsExposureLogicTests {
    @Test("DiscountsExposureLogic policy calculations")
    func testDiscountsExposureLogic() {
        let logic = DiscountsExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1851))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1850))
    }
}
