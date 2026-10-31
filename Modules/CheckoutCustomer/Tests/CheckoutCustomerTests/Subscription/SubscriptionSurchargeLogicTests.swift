import CheckoutCustomer
import Testing

@Suite("SubscriptionSurchargeLogic")
struct SubscriptionSurchargeLogicTests {
    @Test("SubscriptionSurchargeLogic policy calculations")
    func testSubscriptionSurchargeLogic() {
        let logic = SubscriptionSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 1326))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1325))
    }
}
