import CheckoutDomain
import Testing

@Suite("OrdersAllocationLogic")
struct OrdersAllocationLogicTests {
    @Test("OrdersAllocationLogic policy calculations")
    func testOrdersAllocationLogic() {
        let logic = OrdersAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2051))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2050))
    }
}
