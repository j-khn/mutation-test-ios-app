import CheckoutDomain
import Testing

@Suite("OrdersEligibilityLogic")
struct OrdersEligibilityLogicTests {
    @Test("OrdersEligibilityLogic policy calculations")
    func testOrdersEligibilityLogic() {
        let logic = OrdersEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2026))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2025))
    }
}
