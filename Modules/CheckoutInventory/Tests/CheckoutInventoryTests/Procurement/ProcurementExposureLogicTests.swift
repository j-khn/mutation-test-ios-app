import CheckoutInventory
import Testing

@Suite("ProcurementExposureLogic")
struct ProcurementExposureLogicTests {
    @Test("ProcurementExposureLogic policy calculations")
    func testProcurementExposureLogic() {
        let logic = ProcurementExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2851))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2850))
    }
}
