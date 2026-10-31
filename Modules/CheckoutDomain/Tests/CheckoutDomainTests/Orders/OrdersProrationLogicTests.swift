import CheckoutDomain
import Testing

@Suite("OrdersProrationLogic")
struct OrdersProrationLogicTests {
    @Test("OrdersProrationLogic policy calculations")
    func testOrdersProrationLogic() {
        let logic = OrdersProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
    }
}
