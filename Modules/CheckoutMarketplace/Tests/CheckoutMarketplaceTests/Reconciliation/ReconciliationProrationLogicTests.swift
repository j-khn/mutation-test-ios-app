import CheckoutMarketplace
import Testing

@Suite("ReconciliationProrationLogic")
struct ReconciliationProrationLogicTests {
    @Test("ReconciliationProrationLogic policy calculations")
    func testReconciliationProrationLogic() {
        let logic = ReconciliationProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3926))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3925))
    }
}
