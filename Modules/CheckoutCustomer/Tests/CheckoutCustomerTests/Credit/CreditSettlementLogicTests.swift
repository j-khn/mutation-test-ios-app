import CheckoutCustomer
import Testing

@Suite("CreditSettlementLogic")
struct CreditSettlementLogicTests {
    @Test("CreditSettlementLogic policy calculations")
    func testCreditSettlementLogic() {
        let logic = CreditSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3726))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3725))
    }
}
