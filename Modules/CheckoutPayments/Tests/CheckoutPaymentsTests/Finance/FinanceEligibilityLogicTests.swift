import CheckoutPayments
import Testing

@Suite("FinanceEligibilityLogic")
struct FinanceEligibilityLogicTests {
    @Test("FinanceEligibilityLogic policy calculations")
    func testFinanceEligibilityLogic() {
        let logic = FinanceEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3526))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3525))
    }
}
