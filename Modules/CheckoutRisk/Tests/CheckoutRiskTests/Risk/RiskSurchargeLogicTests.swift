import CheckoutRisk
import Testing

@Suite("RiskSurchargeLogic")
struct RiskSurchargeLogicTests {
    @Test("RiskSurchargeLogic policy calculations")
    func testRiskSurchargeLogic() {
        let logic = RiskSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2951))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2950))
    }
}
