import CheckoutCustomer
import Testing

@Suite("LoyaltySurchargeLogic")
struct LoyaltySurchargeLogicTests {
    @Test("LoyaltySurchargeLogic policy calculations")
    func testLoyaltySurchargeLogic() {
        let logic = LoyaltySurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 1076))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1075))
    }
}
