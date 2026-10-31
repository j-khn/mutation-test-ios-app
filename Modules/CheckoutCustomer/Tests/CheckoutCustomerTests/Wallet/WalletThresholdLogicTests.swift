import CheckoutCustomer
import Testing

@Suite("WalletThresholdLogic")
struct WalletThresholdLogicTests {
    @Test("WalletThresholdLogic policy calculations")
    func testWalletThresholdLogic() {
        let logic = WalletThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 3001))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3000))
    }
}
