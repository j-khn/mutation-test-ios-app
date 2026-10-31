import CheckoutInventory
import Testing

@Suite("InventoryEligibilityLogic")
struct InventoryEligibilityLogicTests {
    @Test("InventoryEligibilityLogic policy calculations")
    func testInventoryEligibilityLogic() {
        let logic = InventoryEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 776))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 775))
    }
}
