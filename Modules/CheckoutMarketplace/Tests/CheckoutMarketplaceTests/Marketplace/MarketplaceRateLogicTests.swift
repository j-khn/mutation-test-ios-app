import CheckoutMarketplace
import Testing

@Suite("MarketplaceRateLogic")
struct MarketplaceRateLogicTests {
    @Test("MarketplaceRateLogic policy calculations")
    func testMarketplaceRateLogic() {
        let logic = MarketplaceRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
    }
}
