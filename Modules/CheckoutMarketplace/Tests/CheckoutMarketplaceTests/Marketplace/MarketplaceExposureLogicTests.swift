import CheckoutMarketplace
import Testing

@Suite("MarketplaceExposureLogic")
struct MarketplaceExposureLogicTests {
    @Test("MarketplaceExposureLogic policy calculations")
    func testMarketplaceExposureLogic() {
        let logic = MarketplaceExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
    }
}
