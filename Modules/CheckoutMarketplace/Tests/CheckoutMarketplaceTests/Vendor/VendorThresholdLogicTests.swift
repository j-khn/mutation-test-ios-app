import CheckoutMarketplace
import Testing

@Suite("VendorThresholdLogic")
struct VendorThresholdLogicTests {
    @Test("VendorThresholdLogic policy calculations")
    func testVendorThresholdLogic() {
        let logic = VendorThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2501))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2500))
    }
}
