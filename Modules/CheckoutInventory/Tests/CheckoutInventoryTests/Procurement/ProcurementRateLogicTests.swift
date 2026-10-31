import CheckoutInventory
import Testing

@Suite("ProcurementRateLogic")
struct ProcurementRateLogicTests {
    @Test("ProcurementRateLogic policy calculations")
    func testProcurementRateLogic() {
        let logic = ProcurementRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2826))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2825))
    }
}
