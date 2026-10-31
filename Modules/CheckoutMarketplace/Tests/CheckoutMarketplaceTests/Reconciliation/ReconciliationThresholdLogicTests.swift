import CheckoutMarketplace
import Testing

@Suite("ReconciliationThresholdLogic")
struct ReconciliationThresholdLogicTests {
    @Test("ReconciliationThresholdLogic policy calculations")
    func testReconciliationThresholdLogic() {
        let logic = ReconciliationThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 3876))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3875))
    }
}
