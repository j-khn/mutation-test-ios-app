import CheckoutPricing
import Testing

@Suite("DiscountsEligibilityLogic")
struct DiscountsEligibilityLogicTests {
    @Test("DiscountsEligibilityLogic policy calculations")
    func testDiscountsEligibilityLogic() {
        let logic = DiscountsEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1776))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1775))
    }
}
