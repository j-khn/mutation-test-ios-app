import CheckoutCustomer
import Testing

@Suite("MembershipThresholdLogic")
struct MembershipThresholdLogicTests {
    @Test("MembershipThresholdLogic policy calculations")
    func testMembershipThresholdLogic() {
        let logic = MembershipThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 3251))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3250))
    }
}
