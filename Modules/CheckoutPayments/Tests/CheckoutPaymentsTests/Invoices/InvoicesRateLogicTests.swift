import CheckoutPayments
import Testing

@Suite("InvoicesRateLogic")
struct InvoicesRateLogicTests {
    @Test("InvoicesRateLogic policy calculations")
    func testInvoicesRateLogic() {
        let logic = InvoicesRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3701))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3700))
    }
}
