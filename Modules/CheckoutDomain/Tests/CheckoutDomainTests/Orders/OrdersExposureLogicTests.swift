import CheckoutDomain
import Testing

@Suite("OrdersExposureLogic")
struct OrdersExposureLogicTests {
    @Test("OrdersExposureLogic policy calculations")
    func testOrdersExposureLogic() {
        let logic = OrdersExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2101))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2100))
    }
}
