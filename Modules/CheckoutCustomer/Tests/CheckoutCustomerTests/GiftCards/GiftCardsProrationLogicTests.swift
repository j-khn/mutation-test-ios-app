import CheckoutCustomer
import Testing

@Suite("GiftCardsProrationLogic")
struct GiftCardsProrationLogicTests {
    @Test("GiftCardsProrationLogic policy calculations")
    func testGiftCardsProrationLogic() {
        let logic = GiftCardsProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3176))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3175))
    }
}
