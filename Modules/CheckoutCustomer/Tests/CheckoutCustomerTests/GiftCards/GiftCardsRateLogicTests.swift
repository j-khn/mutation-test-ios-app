import CheckoutCustomer
import Testing

@Suite("GiftCardsRateLogic")
struct GiftCardsRateLogicTests {
    @Test("GiftCardsRateLogic policy calculations")
    func testGiftCardsRateLogic() {
        let logic = GiftCardsRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3326))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3325))
    }
}
