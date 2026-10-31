import CheckoutCustomer
import Testing

@Suite("LoyaltySettlementLogic")
struct LoyaltySettlementLogicTests {
    @Test("LoyaltySettlementLogic policy calculations")
    func testLoyaltySettlementLogic() {
        let logic = LoyaltySettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1101))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1100))
    }
}
