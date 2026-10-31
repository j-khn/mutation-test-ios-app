import CheckoutShipping
import Testing

@Suite("FulfillmentThresholdLogic")
struct FulfillmentThresholdLogicTests {
    @Test("FulfillmentThresholdLogic policy calculations")
    func testFulfillmentThresholdLogic() {
        let logic = FulfillmentThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2001))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2000))
    }
}
