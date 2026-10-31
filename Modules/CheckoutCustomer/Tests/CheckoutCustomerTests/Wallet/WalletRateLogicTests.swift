import CheckoutCustomer
import Testing

@Suite("WalletRateLogic")
struct WalletRateLogicTests {
    @Test("WalletRateLogic policy calculations")
    func testWalletRateLogic() {
        let logic = WalletRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3201))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3200))
    }
}
