import CheckoutShipping
import Testing

@Suite("DeliverySurchargeLogic")
struct DeliverySurchargeLogicTests {
    @Test("DeliverySurchargeLogic policy calculations")
    func testDeliverySurchargeLogic() {
        let logic = DeliverySurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2201))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2200))
    }
}
