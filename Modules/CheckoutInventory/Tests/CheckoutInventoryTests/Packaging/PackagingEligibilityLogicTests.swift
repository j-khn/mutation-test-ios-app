import CheckoutInventory
import Testing

@Suite("PackagingEligibilityLogic")
struct PackagingEligibilityLogicTests {
    @Test("PackagingEligibilityLogic policy calculations")
    func testPackagingEligibilityLogic() {
        let logic = PackagingEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2401))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2400))
    }
}
