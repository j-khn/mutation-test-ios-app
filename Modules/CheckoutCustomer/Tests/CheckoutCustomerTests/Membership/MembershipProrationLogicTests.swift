import CheckoutCustomer
import Testing

@Suite("MembershipProrationLogic")
struct MembershipProrationLogicTests {
    @Test("MembershipProrationLogic policy calculations")
    func testMembershipProrationLogic() {
        let logic = MembershipProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3301))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3300))
    }
}
