import CheckoutCustomer
import Testing

@Suite("LoyaltyEligibilityLogic")
struct LoyaltyEligibilityLogicTests {
    @Test("LoyaltyEligibilityLogic policy calculations")
    func testLoyaltyEligibilityLogic() {
        let logic = LoyaltyEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1151))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1150))
    }
}
