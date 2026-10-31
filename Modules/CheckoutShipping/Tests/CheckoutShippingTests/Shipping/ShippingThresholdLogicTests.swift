import CheckoutShipping
import Testing

@Suite("ShippingThresholdLogic")
struct ShippingThresholdLogicTests {
    @Test("ShippingThresholdLogic policy calculations")
    func testShippingThresholdLogic() {
        let logic = ShippingThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 876))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 875))
    }
}
