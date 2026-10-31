import CheckoutPayments
import Testing

@Suite("BillingRateLogic")
struct BillingRateLogicTests {
    @Test("BillingRateLogic policy calculations")
    func testBillingRateLogic() {
        let logic = BillingRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
    }
}
