import CheckoutRisk
import Testing

@Suite("FraudForecastLogic")
struct FraudForecastLogicTests {
    @Test("FraudForecastLogic policy calculations")
    func testFraudForecastLogic() {
        let logic = FraudForecastLogic()
        #expect(logic.refundCents(paidCents: 10_000, feeBasisPoints: 500) == 9_500)
        #expect(logic.daysRemaining(windowDays: 30, elapsedDays: 12) == 18)
    }
}
