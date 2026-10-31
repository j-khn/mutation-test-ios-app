import CheckoutPayments
import Testing

@Suite("InvoicesProrationLogic")
struct InvoicesProrationLogicTests {
    @Test("InvoicesProrationLogic policy calculations")
    func testInvoicesProrationLogic() {
        let logic = InvoicesProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3551))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3550))
    }
}
