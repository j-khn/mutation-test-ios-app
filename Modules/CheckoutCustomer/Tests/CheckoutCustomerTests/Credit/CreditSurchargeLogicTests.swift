import CheckoutCustomer
import Testing

@Suite("CreditSurchargeLogic")
struct CreditSurchargeLogicTests {
    @Test("CreditSurchargeLogic policy calculations")
    func testCreditSurchargeLogic() {
        let logic = CreditSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 3701))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3700))
    }
}
