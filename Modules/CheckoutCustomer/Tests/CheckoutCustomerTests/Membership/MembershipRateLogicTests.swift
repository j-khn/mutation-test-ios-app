import CheckoutCustomer
import Testing

@Suite("MembershipRateLogic")
struct MembershipRateLogicTests {
    @Test("MembershipRateLogic policy calculations")
    func testMembershipRateLogic() {
        let logic = MembershipRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
    }
}
