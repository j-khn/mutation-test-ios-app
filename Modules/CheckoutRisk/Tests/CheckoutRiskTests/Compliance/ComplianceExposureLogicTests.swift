import CheckoutRisk
import Testing

@Suite("ComplianceExposureLogic")
struct ComplianceExposureLogicTests {
    @Test("ComplianceExposureLogic policy calculations")
    func testComplianceExposureLogic() {
        let logic = ComplianceExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4226))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4225))
    }
}
