import CheckoutMarketplace
import Testing

@Suite("MarketplaceRateLogic additional behavior")
struct MarketplaceRateLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = MarketplaceRateLogic()
        #expect(logic.validRate(rateBasisPoints: 8_250))
    }
}
