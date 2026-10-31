import CheckoutRisk
import Testing

@Suite("ComplianceSurchargeLogic")
struct ComplianceSurchargeLogicTests {
    @Test("ComplianceSurchargeLogic policy calculations")
    func testComplianceSurchargeLogic() {
        let logic = ComplianceSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 4076))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4075))
    }
}
