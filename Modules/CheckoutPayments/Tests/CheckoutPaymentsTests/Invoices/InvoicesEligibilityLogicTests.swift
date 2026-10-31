import CheckoutPayments
import Testing

@Suite("InvoicesEligibilityLogic")
struct InvoicesEligibilityLogicTests {
    @Test("InvoicesEligibilityLogic policy calculations")
    func testInvoicesEligibilityLogic() {
        let logic = InvoicesEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3651))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3650))
    }
}
