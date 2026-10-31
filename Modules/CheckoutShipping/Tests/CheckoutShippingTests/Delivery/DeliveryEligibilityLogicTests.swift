import CheckoutShipping
import Testing

@Suite("DeliveryEligibilityLogic")
struct DeliveryEligibilityLogicTests {
    @Test("DeliveryEligibilityLogic policy calculations")
    func testDeliveryEligibilityLogic() {
        let logic = DeliveryEligibilityLogic()
        #expect(logic.cycleChargeCents(monthlyCents: 1_200, cycles: 3) == 3_600)
        #expect(logic.trialDaysRemaining(trialDays: 14, elapsedDays: 5) == 9)
    }
}
