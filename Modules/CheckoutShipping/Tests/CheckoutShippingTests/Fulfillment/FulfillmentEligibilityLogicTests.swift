import CheckoutShipping
import Testing

@Suite("FulfillmentEligibilityLogic")
struct FulfillmentEligibilityLogicTests {
    @Test("FulfillmentEligibilityLogic policy calculations")
    func testFulfillmentEligibilityLogic() {
        let logic = FulfillmentEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2151))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2150))
    }
}
