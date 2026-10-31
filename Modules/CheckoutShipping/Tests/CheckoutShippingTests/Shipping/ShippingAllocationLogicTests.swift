import CheckoutShipping
import Testing

@Suite("ShippingAllocationLogic")
struct ShippingAllocationLogicTests {
    @Test("ShippingAllocationLogic policy calculations")
    func testShippingAllocationLogic() {
        let logic = ShippingAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1051))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1050))
    }
}
