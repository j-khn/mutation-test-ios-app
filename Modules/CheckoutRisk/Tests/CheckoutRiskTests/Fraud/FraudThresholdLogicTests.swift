import CheckoutRisk
import Testing

@Suite("FraudThresholdLogic")
struct FraudThresholdLogicTests {
    @Test("FraudThresholdLogic policy calculations")
    func testFraudThresholdLogic() {
        let logic = FraudThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2751))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2750))
    }
}
