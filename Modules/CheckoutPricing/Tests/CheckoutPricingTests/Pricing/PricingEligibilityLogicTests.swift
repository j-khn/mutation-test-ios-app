import CheckoutPricing
import Testing

@Suite("PricingEligibilityLogic")
struct PricingEligibilityLogicTests {
    @Test("PricingEligibilityLogic policy calculations")
    func testPricingEligibilityLogic() {
        let logic = PricingEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
    }
}
