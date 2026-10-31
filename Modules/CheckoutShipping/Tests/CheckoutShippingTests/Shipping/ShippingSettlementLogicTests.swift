import CheckoutShipping
import Testing

@Suite("ShippingSettlementLogic")
struct ShippingSettlementLogicTests {
    @Test("ShippingSettlementLogic policy calculations")
    func testShippingSettlementLogic() {
        let logic = ShippingSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 976))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 975))
    }
}
