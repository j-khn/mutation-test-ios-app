import CheckoutPricing
import Testing

@Suite("TaxSettlementLogic")
struct TaxSettlementLogicTests {
    @Test("TaxSettlementLogic policy calculations")
    func testTaxSettlementLogic() {
        let logic = TaxSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1601))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1600))
    }
}
