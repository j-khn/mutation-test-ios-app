import CheckoutRisk
import Testing

@Suite("ComplianceRateLogic")
struct ComplianceRateLogicTests {
    @Test("ComplianceRateLogic policy calculations")
    func testComplianceRateLogic() {
        let logic = ComplianceRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4201))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4200))
    }
}
