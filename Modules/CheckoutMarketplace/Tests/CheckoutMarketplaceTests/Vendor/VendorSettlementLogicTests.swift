import CheckoutMarketplace
import Testing

@Suite("VendorSettlementLogic")
struct VendorSettlementLogicTests {
    @Test("VendorSettlementLogic policy calculations")
    func testVendorSettlementLogic() {
        let logic = VendorSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
    }
}
