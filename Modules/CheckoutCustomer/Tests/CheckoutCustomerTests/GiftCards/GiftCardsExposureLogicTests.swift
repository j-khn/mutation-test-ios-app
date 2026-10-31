import CheckoutCustomer
import Testing

@Suite("GiftCardsExposureLogic")
struct GiftCardsExposureLogicTests {
    @Test("GiftCardsExposureLogic policy calculations")
    func testGiftCardsExposureLogic() {
        let logic = GiftCardsExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3351))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3350))
    }
}
