import CheckoutCustomer
import Testing

@Suite("SubscriptionEligibilityLogic")
struct SubscriptionEligibilityLogicTests {
    @Test("SubscriptionEligibilityLogic policy calculations")
    func testSubscriptionEligibilityLogic() {
        let logic = SubscriptionEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1401))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1400))
    }
}
