import CheckoutMarketplace
import Testing

@Suite("ReconciliationEligibilityLogic")
struct ReconciliationEligibilityLogicTests {
    @Test("ReconciliationEligibilityLogic policy calculations")
    func testReconciliationEligibilityLogic() {
        let logic = ReconciliationEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4026))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4025))
    }
}
