import CheckoutPayments
import Testing

@Suite("PaymentsRateLogic")
struct PaymentsRateLogicTests {
    @Test("PaymentsRateLogic policy calculations")
    func testPaymentsRateLogic() {
        let logic = PaymentsRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1576))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1575))
    }
}
