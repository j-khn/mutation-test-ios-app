import CheckoutPayments
import Testing

@Suite("RefundsProrationLogic")
struct RefundsProrationLogicTests {
    @Test("RefundsProrationLogic policy calculations")
    func testRefundsProrationLogic() {
        let logic = RefundsProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3801))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3800))
    }
}
