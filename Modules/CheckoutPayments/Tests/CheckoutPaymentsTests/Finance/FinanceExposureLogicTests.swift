import CheckoutPayments
import Testing

@Suite("FinanceExposureLogic")
struct FinanceExposureLogicTests {
    @Test("FinanceExposureLogic policy calculations")
    func testFinanceExposureLogic() {
        let logic = FinanceExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3601))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3600))
    }
}
