import CheckoutCustomer
import Testing

@Suite("MembershipAllocationLogic")
struct MembershipAllocationLogicTests {
    @Test("MembershipAllocationLogic policy calculations")
    func testMembershipAllocationLogic() {
        let logic = MembershipAllocationLogic()
        #expect(logic.settledCents(capturedCents: 1_000, refundedCents: 250) == 750)
        #expect(logic.processingFeeCents(amountCents: 10_000, feeBasisPoints: 300) == 300)
    }
}
