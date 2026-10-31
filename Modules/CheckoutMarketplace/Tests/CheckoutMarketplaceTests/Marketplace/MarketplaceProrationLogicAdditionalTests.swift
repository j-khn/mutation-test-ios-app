import CheckoutMarketplace
import Testing

@Suite("MarketplaceProrationLogic additional behavior")
struct MarketplaceProrationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = MarketplaceProrationLogic()
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
    }
}
