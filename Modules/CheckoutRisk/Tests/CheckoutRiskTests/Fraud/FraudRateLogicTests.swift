import CheckoutRisk
import Testing

@Suite("FraudRateLogic")
struct FraudRateLogicTests {
    @Test("FraudRateLogic policy calculations")
    func testFraudRateLogic() {
        let logic = FraudRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
    }
}
