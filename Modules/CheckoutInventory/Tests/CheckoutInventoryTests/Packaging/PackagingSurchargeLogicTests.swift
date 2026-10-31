import CheckoutInventory
import Testing

@Suite("PackagingSurchargeLogic")
struct PackagingSurchargeLogicTests {
    @Test("PackagingSurchargeLogic policy calculations")
    func testPackagingSurchargeLogic() {
        let logic = PackagingSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2326))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2325))
    }
}
