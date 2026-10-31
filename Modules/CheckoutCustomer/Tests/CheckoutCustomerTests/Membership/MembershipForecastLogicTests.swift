import CheckoutCustomer
import Testing

@Suite("MembershipForecastLogic")
struct MembershipForecastLogicTests {
    @Test("MembershipForecastLogic policy calculations")
    func testMembershipForecastLogic() {
        let logic = MembershipForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
        #expect(logic.eligible(elapsedDays: 12, windowDays: 30, finalSale: false))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3376))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3375))
    }
}
