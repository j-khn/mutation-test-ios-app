import CheckoutPayments
import Testing

@Suite("InvoicesExposureLogic")
struct InvoicesExposureLogicTests {
    @Test("InvoicesExposureLogic policy calculations")
    func testInvoicesExposureLogic() {
        let logic = InvoicesExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3726))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3725))
    }
}
