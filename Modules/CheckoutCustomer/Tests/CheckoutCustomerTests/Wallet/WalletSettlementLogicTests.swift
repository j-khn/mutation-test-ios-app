import CheckoutCustomer
import Testing

@Suite("WalletSettlementLogic")
struct WalletSettlementLogicTests {
    @Test("WalletSettlementLogic policy calculations")
    func testWalletSettlementLogic() {
        let logic = WalletSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3101))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3100))
    }
}
