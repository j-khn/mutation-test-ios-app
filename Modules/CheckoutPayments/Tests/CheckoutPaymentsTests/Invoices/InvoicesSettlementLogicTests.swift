import CheckoutPayments
import Testing

@Suite("InvoicesSettlementLogic")
struct InvoicesSettlementLogicTests {
    @Test("InvoicesSettlementLogic policy calculations")
    func testInvoicesSettlementLogic() {
        let logic = InvoicesSettlementLogic()
        #expect(logic.pointsEarned(spendCents: 2_500, pointsPerDollar: 2) == 50)
        #expect(logic.redemptionCents(points: 20, centsPerPoint: 2) == 40)
        #expect(logic.canRedeem(requested: 2, balance: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3601))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3600))
    }
}
