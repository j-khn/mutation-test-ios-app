import CheckoutPricing
import Testing

@Suite("PromotionsSurchargeLogic")
struct PromotionsSurchargeLogicTests {
    @Test("PromotionsSurchargeLogic policy calculations")
    func testPromotionsSurchargeLogic() {
        let logic = PromotionsSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 1826))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1825))
    }
}
