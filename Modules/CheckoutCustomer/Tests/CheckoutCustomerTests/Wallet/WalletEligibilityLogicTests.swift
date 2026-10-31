import CheckoutCustomer
import Testing

@Suite("WalletEligibilityLogic")
struct WalletEligibilityLogicTests {
    @Test("WalletEligibilityLogic policy calculations")
    func testWalletEligibilityLogic() {
        let logic = WalletEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3151))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3150))
    }
}
