import CheckoutPricing
import Testing

@Suite("PromotionsThresholdLogic")
struct PromotionsThresholdLogicTests {
    @Test("PromotionsThresholdLogic policy calculations")
    func testPromotionsThresholdLogic() {
        let logic = PromotionsThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 1751))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1750))
    }
}
