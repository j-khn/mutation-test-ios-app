import CheckoutInventory
import Testing

@Suite("InventorySettlementLogic")
struct InventorySettlementLogicTests {
    @Test("InventorySettlementLogic policy calculations")
    func testInventorySettlementLogic() {
        let logic = InventorySettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
    }
}
