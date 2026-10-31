import CheckoutDomain
import Testing

@Suite("OrdersAllocationLogic")
struct OrdersAllocationLogicTests {
    @Test("OrdersAllocationLogic policy calculations")
    func testOrdersAllocationLogic() {
        let logic = OrdersAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
    }
}
