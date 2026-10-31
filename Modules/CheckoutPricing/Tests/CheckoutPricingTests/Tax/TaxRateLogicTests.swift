import CheckoutPricing
import Testing

@Suite("TaxRateLogic")
struct TaxRateLogicTests {
    @Test("TaxRateLogic policy calculations")
    func testTaxRateLogic() {
        let logic = TaxRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
    }
}
