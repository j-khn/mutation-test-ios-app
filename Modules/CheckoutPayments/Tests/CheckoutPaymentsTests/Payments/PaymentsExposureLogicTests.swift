import CheckoutPayments
import Testing

@Suite("PaymentsExposureLogic")
struct PaymentsExposureLogicTests {
    @Test("PaymentsExposureLogic policy calculations")
    func testPaymentsExposureLogic() {
        let logic = PaymentsExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1601))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1600))
    }
}
