import CheckoutCustomer
import Testing

@Suite("MembershipAllocationLogic")
struct MembershipAllocationLogicTests {
    @Test("MembershipAllocationLogic policy calculations")
    func testMembershipAllocationLogic() {
        let logic = MembershipAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
        #expect(logic.isWithinLimit(amountCents: 500, limitCents: 500))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3426))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3425))
    }
}
