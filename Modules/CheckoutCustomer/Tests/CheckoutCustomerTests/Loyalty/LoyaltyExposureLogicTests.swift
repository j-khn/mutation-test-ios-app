import CheckoutCustomer
import Testing

@Suite("LoyaltyExposureLogic")
struct LoyaltyExposureLogicTests {
    @Test("LoyaltyExposureLogic policy calculations")
    func testLoyaltyExposureLogic() {
        let logic = LoyaltyExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1226))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1225))
    }
}
