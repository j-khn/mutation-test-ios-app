import CheckoutCustomer
import Testing

@Suite("MembershipSettlementLogic")
struct MembershipSettlementLogicTests {
    @Test("MembershipSettlementLogic policy calculations")
    func testMembershipSettlementLogic() {
        let logic = MembershipSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3351))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3350))
    }
}
