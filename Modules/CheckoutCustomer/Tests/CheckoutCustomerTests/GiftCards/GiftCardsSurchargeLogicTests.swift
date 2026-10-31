import CheckoutCustomer
import Testing

@Suite("GiftCardsSurchargeLogic")
struct GiftCardsSurchargeLogicTests {
    @Test("GiftCardsSurchargeLogic policy calculations")
    func testGiftCardsSurchargeLogic() {
        let logic = GiftCardsSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 3201))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3200))
    }
}
