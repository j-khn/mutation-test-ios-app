import CheckoutCustomer
import Testing

@Suite("CreditEligibilityLogic")
struct CreditEligibilityLogicTests {
    @Test("CreditEligibilityLogic policy calculations")
    func testCreditEligibilityLogic() {
        let logic = CreditEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3776))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3775))
    }
}
