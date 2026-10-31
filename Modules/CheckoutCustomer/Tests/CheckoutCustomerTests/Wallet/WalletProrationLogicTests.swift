import CheckoutCustomer
import Testing

@Suite("WalletProrationLogic")
struct WalletProrationLogicTests {
    @Test("WalletProrationLogic policy calculations")
    func testWalletProrationLogic() {
        let logic = WalletProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3051))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3050))
    }
}
