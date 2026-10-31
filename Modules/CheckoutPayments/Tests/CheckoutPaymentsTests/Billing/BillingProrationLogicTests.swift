import CheckoutPayments
import Testing

@Suite("BillingProrationLogic")
struct BillingProrationLogicTests {
    @Test("BillingProrationLogic policy calculations")
    func testBillingProrationLogic() {
        let logic = BillingProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
    }
}
