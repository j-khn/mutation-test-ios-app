import CheckoutMarketplace
import Testing

@Suite("ReconciliationExposureLogic")
struct ReconciliationExposureLogicTests {
    @Test("ReconciliationExposureLogic policy calculations")
    func testReconciliationExposureLogic() {
        let logic = ReconciliationExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4101))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4100))
    }
}
