import CheckoutMarketplace
import Testing

@Suite("VendorRateLogic")
struct VendorRateLogicTests {
    @Test("VendorRateLogic policy calculations")
    func testVendorRateLogic() {
        let logic = VendorRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2701))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2700))
    }
}
