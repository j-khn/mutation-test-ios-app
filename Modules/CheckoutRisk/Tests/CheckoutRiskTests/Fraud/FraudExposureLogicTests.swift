import CheckoutRisk
import Testing

@Suite("FraudExposureLogic")
struct FraudExposureLogicTests {
    @Test("FraudExposureLogic policy calculations")
    func testFraudExposureLogic() {
        let logic = FraudExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2976))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2975))
    }
}
