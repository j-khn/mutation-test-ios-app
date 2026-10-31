import CheckoutRisk
import Testing

@Suite("RiskThresholdLogic")
struct RiskThresholdLogicTests {
    @Test("RiskThresholdLogic policy calculations")
    func testRiskThresholdLogic() {
        let logic = RiskThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2876))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2875))
    }
}
