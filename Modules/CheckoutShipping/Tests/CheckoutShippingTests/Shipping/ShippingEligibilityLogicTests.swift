import CheckoutShipping
import Testing

@Suite("ShippingEligibilityLogic")
struct ShippingEligibilityLogicTests {
    @Test("ShippingEligibilityLogic policy calculations")
    func testShippingEligibilityLogic() {
        let logic = ShippingEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1026))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1025))
    }
}
