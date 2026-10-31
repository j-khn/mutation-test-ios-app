import CheckoutPricing
import Testing

@Suite("PromotionsEligibilityLogic")
struct PromotionsEligibilityLogicTests {
    @Test("PromotionsEligibilityLogic policy calculations")
    func testPromotionsEligibilityLogic() {
        let logic = PromotionsEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1901))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1900))
    }
}
