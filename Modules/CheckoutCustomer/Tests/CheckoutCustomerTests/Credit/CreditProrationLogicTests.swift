import CheckoutCustomer
import Testing

@Suite("CreditProrationLogic")
struct CreditProrationLogicTests {
    @Test("CreditProrationLogic policy calculations")
    func testCreditProrationLogic() {
        let logic = CreditProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3676))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3675))
    }
}
