import CheckoutPayments
import Testing

@Suite("ReturnsThresholdLogic")
struct ReturnsThresholdLogicTests {
    @Test("ReturnsThresholdLogic policy calculations")
    func testReturnsThresholdLogic() {
        let logic = ReturnsThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 1126))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1125))
    }
}
