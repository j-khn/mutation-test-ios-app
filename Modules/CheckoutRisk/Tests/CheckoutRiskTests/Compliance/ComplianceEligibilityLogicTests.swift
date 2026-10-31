import CheckoutRisk
import Testing

@Suite("ComplianceEligibilityLogic")
struct ComplianceEligibilityLogicTests {
    @Test("ComplianceEligibilityLogic policy calculations")
    func testComplianceEligibilityLogic() {
        let logic = ComplianceEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4151))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4150))
    }
}
