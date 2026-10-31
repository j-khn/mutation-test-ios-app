import CheckoutInventory
import Testing

@Suite("PackagingThresholdLogic")
struct PackagingThresholdLogicTests {
    @Test("PackagingThresholdLogic policy calculations")
    func testPackagingThresholdLogic() {
        let logic = PackagingThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2251))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2250))
    }
}
