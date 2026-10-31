import CheckoutMarketplace
import Testing

@Suite("ReconciliationSurchargeLogic")
struct ReconciliationSurchargeLogicTests {
    @Test("ReconciliationSurchargeLogic policy calculations")
    func testReconciliationSurchargeLogic() {
        let logic = ReconciliationSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 3951))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3950))
    }
}
