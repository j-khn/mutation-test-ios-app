import CheckoutShipping
import Testing

@Suite("ShippingSurchargeLogic")
struct ShippingSurchargeLogicTests {
    @Test("ShippingSurchargeLogic policy calculations")
    func testShippingSurchargeLogic() {
        let logic = ShippingSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 951))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 950))
    }
}
