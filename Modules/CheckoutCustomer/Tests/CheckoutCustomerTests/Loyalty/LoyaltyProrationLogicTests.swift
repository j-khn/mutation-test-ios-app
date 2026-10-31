import CheckoutCustomer
import Testing

@Suite("LoyaltyProrationLogic")
struct LoyaltyProrationLogicTests {
    @Test("LoyaltyProrationLogic policy calculations")
    func testLoyaltyProrationLogic() {
        let logic = LoyaltyProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1051))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1050))
    }
}
