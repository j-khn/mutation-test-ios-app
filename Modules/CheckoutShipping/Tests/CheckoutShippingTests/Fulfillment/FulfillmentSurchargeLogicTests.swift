import CheckoutShipping
import Testing

@Suite("FulfillmentSurchargeLogic")
struct FulfillmentSurchargeLogicTests {
    @Test("FulfillmentSurchargeLogic policy calculations")
    func testFulfillmentSurchargeLogic() {
        let logic = FulfillmentSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2076))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2075))
    }
}
