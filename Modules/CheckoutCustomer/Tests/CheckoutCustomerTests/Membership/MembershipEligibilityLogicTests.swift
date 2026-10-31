import CheckoutCustomer
import Testing

@Suite("MembershipEligibilityLogic")
struct MembershipEligibilityLogicTests {
    @Test("MembershipEligibilityLogic policy calculations")
    func testMembershipEligibilityLogic() {
        let logic = MembershipEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
    }
}
