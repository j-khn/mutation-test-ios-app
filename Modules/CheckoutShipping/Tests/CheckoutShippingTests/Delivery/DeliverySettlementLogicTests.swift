import CheckoutShipping
import Testing

@Suite("DeliverySettlementLogic")
struct DeliverySettlementLogicTests {
    @Test("DeliverySettlementLogic policy calculations")
    func testDeliverySettlementLogic() {
        let logic = DeliverySettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
    }
}
