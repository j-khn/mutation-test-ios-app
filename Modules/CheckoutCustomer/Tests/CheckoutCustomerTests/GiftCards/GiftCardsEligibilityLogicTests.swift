import CheckoutCustomer
import Testing

@Suite("GiftCardsEligibilityLogic")
struct GiftCardsEligibilityLogicTests {
    @Test("GiftCardsEligibilityLogic policy calculations")
    func testGiftCardsEligibilityLogic() {
        let logic = GiftCardsEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3276))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3275))
    }
}
