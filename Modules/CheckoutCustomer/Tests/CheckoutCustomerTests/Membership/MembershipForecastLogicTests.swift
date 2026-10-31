import CheckoutCustomer
import Testing

@Suite("MembershipForecastLogic")
struct MembershipForecastLogicTests {
    @Test("MembershipForecastLogic policy calculations")
    func testMembershipForecastLogic() {
        let logic = MembershipForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
    }
}
