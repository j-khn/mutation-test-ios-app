import CheckoutCustomer
import Testing

@Suite("GiftCardsSettlementLogic")
struct GiftCardsSettlementLogicTests {
    @Test("GiftCardsSettlementLogic policy calculations")
    func testGiftCardsSettlementLogic() {
        let logic = GiftCardsSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3226))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3225))
    }
}
