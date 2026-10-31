import CheckoutPayments
import Testing

@Suite("RefundsExposureLogic")
struct RefundsExposureLogicTests {
    @Test("RefundsExposureLogic policy calculations")
    func testRefundsExposureLogic() {
        let logic = RefundsExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3976))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3975))
    }
}
