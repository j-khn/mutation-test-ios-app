import CheckoutMarketplace
import Testing

@Suite("MarketplaceAllocationLogic additional behavior")
struct MarketplaceAllocationLogicAdditionalTests {
    @Test("checks an additional business-rule case")
    func additionalBehavior() {
        let logic = MarketplaceAllocationLogic()
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
    }
}
