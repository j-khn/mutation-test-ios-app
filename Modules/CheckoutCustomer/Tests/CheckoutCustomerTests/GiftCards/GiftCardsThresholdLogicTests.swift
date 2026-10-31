import CheckoutCustomer
import Testing

@Suite("GiftCardsThresholdLogic")
struct GiftCardsThresholdLogicTests {
    @Test("GiftCardsThresholdLogic policy calculations")
    func testGiftCardsThresholdLogic() {
        let logic = GiftCardsThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 3126))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3125))
    }
}
