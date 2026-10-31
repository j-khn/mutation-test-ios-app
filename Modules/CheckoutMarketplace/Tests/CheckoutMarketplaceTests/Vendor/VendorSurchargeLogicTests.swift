import CheckoutMarketplace
import Testing

@Suite("VendorSurchargeLogic")
struct VendorSurchargeLogicTests {
    @Test("VendorSurchargeLogic policy calculations")
    func testVendorSurchargeLogic() {
        let logic = VendorSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2576))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2575))
    }
}
