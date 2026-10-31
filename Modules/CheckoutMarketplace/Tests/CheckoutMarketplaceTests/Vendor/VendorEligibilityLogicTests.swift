import CheckoutMarketplace
import Testing

@Suite("VendorEligibilityLogic")
struct VendorEligibilityLogicTests {
    @Test("VendorEligibilityLogic policy calculations")
    func testVendorEligibilityLogic() {
        let logic = VendorEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
        #expect(logic.shouldRenew(isActive: true, paymentValid: true))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2651))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2650))
    }
}
