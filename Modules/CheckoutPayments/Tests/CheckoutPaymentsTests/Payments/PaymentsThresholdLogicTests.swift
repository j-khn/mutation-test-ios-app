import CheckoutPayments
import Testing

@Suite("PaymentsThresholdLogic")
struct PaymentsThresholdLogicTests {
    @Test("PaymentsThresholdLogic policy calculations")
    func testPaymentsThresholdLogic() {
        let logic = PaymentsThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 1376))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1375))
    }
}
