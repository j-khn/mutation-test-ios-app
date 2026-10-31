import CheckoutPayments
import Testing

@Suite("PaymentsSurchargeLogic")
struct PaymentsSurchargeLogicTests {
    @Test("PaymentsSurchargeLogic policy calculations")
    func testPaymentsSurchargeLogic() {
        let logic = PaymentsSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 1451))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1450))
    }
}
