import CheckoutPricing
import Testing

@Suite("DiscountsSurchargeLogic")
struct DiscountsSurchargeLogicTests {
    @Test("DiscountsSurchargeLogic policy calculations")
    func testDiscountsSurchargeLogic() {
        let logic = DiscountsSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 1701))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1700))
    }
}
