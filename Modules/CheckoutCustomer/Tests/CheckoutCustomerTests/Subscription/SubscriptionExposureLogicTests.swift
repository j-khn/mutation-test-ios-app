import CheckoutCustomer
import Testing

@Suite("SubscriptionExposureLogic")
struct SubscriptionExposureLogicTests {
    @Test("SubscriptionExposureLogic policy calculations")
    func testSubscriptionExposureLogic() {
        let logic = SubscriptionExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1476))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1475))
    }
}
