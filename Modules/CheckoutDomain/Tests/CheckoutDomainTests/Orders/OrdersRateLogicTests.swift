import CheckoutDomain
import Testing

@Suite("OrdersRateLogic")
struct OrdersRateLogicTests {
    @Test("OrdersRateLogic policy calculations")
    func testOrdersRateLogic() {
        let logic = OrdersRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
    }
}
