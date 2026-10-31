import CheckoutInventory
import Testing

@Suite("PackagingRateLogic")
struct PackagingRateLogicTests {
    @Test("PackagingRateLogic policy calculations")
    func testPackagingRateLogic() {
        let logic = PackagingRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2451))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2450))
    }
}
