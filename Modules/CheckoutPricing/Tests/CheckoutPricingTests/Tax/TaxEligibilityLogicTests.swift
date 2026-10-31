import CheckoutPricing
import Testing

@Suite("TaxEligibilityLogic")
struct TaxEligibilityLogicTests {
    @Test("TaxEligibilityLogic policy calculations")
    func testTaxEligibilityLogic() {
        let logic = TaxEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1651))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1650))
    }
}
