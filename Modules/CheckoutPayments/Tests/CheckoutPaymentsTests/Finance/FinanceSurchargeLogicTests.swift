import CheckoutPayments
import Testing

@Suite("FinanceSurchargeLogic")
struct FinanceSurchargeLogicTests {
    @Test("FinanceSurchargeLogic policy calculations")
    func testFinanceSurchargeLogic() {
        let logic = FinanceSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 3451))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3450))
    }
}
