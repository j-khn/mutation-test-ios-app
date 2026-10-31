import CheckoutPayments
import Testing

@Suite("ReturnsEligibilityLogic")
struct ReturnsEligibilityLogicTests {
    @Test("ReturnsEligibilityLogic policy calculations")
    func testReturnsEligibilityLogic() {
        let logic = ReturnsEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1276))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1275))
    }
}
