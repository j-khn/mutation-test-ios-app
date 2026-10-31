import CheckoutShipping
import Testing

@Suite("DeliveryAllocationLogic")
struct DeliveryAllocationLogicTests {
    @Test("DeliveryAllocationLogic policy calculations")
    func testDeliveryAllocationLogic() {
        let logic = DeliveryAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
    }
}
