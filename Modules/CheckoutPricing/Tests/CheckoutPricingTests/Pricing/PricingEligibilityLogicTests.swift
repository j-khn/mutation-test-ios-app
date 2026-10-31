import CheckoutPricing
import Testing

@Suite("PricingEligibilityLogic")
struct PricingEligibilityLogicTests {
    @Test("PricingEligibilityLogic policy calculations")
    func testPricingEligibilityLogic() {
        let logic = PricingEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 651))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 650))
    }
}
