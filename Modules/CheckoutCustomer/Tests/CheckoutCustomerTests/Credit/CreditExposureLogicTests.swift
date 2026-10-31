import CheckoutCustomer
import Testing

@Suite("CreditExposureLogic")
struct CreditExposureLogicTests {
    @Test("CreditExposureLogic policy calculations")
    func testCreditExposureLogic() {
        let logic = CreditExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3851))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3850))
    }
}
