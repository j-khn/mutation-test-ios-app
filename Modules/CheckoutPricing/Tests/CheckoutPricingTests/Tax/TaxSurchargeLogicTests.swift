import CheckoutPricing
import Testing

@Suite("TaxSurchargeLogic")
struct TaxSurchargeLogicTests {
    @Test("TaxSurchargeLogic policy calculations")
    func testTaxSurchargeLogic() {
        let logic = TaxSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 1576))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1575))
    }
}
