import CheckoutPayments
import Testing

@Suite("RefundsEligibilityLogic")
struct RefundsEligibilityLogicTests {
    @Test("RefundsEligibilityLogic policy calculations")
    func testRefundsEligibilityLogic() {
        let logic = RefundsEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3901))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3900))
    }
}
