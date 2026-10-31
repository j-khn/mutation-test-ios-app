import CheckoutInventory
import Testing

@Suite("ProcurementEligibilityLogic")
struct ProcurementEligibilityLogicTests {
    @Test("ProcurementEligibilityLogic policy calculations")
    func testProcurementEligibilityLogic() {
        let logic = ProcurementEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2776))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2775))
    }
}
