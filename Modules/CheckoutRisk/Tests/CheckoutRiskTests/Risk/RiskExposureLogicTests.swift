import CheckoutRisk
import Testing

@Suite("RiskExposureLogic")
struct RiskExposureLogicTests {
    @Test("RiskExposureLogic policy calculations")
    func testRiskExposureLogic() {
        let logic = RiskExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3101))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3100))
    }
}
