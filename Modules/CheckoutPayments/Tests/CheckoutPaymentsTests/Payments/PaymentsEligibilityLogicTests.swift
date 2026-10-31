import CheckoutPayments
import Testing

@Suite("PaymentsEligibilityLogic")
struct PaymentsEligibilityLogicTests {
    @Test("PaymentsEligibilityLogic policy calculations")
    func testPaymentsEligibilityLogic() {
        let logic = PaymentsEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1526))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1525))
    }
}
