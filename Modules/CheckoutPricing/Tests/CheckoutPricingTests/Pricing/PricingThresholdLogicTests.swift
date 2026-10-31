import CheckoutPricing
import Testing

@Suite("PricingThresholdLogic")
struct PricingThresholdLogicTests {
    @Test("PricingThresholdLogic policy calculations")
    func testPricingThresholdLogic() {
        let logic = PricingThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 501))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 500))
    }
}
