import CheckoutRisk
import Testing

@Suite("FraudEligibilityLogic")
struct FraudEligibilityLogicTests {
    @Test("FraudEligibilityLogic policy calculations")
    func testFraudEligibilityLogic() {
        let logic = FraudEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
    }
}
