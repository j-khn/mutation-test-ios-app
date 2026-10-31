import CheckoutMarketplace
import Testing

@Suite("MarketplaceExposureLogic additional behavior")
struct MarketplaceExposureLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = MarketplaceExposureLogic()
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
    }
}
