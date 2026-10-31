import CheckoutInventory
import Testing

@Suite("PackagingSettlementLogic")
struct PackagingSettlementLogicTests {
    @Test("PackagingSettlementLogic policy calculations")
    func testPackagingSettlementLogic() {
        let logic = PackagingSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2351))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2350))
    }
}
