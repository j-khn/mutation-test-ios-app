import CheckoutPayments
import Testing

@Suite("ReturnsExposureLogic")
struct ReturnsExposureLogicTests {
    @Test("ReturnsExposureLogic policy calculations")
    func testReturnsExposureLogic() {
        let logic = ReturnsExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1351))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1350))
    }
}
