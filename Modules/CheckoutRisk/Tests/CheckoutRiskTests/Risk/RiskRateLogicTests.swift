import CheckoutRisk
import Testing

@Suite("RiskRateLogic")
struct RiskRateLogicTests {
    @Test("RiskRateLogic policy calculations")
    func testRiskRateLogic() {
        let logic = RiskRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3076))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3075))
    }
}
