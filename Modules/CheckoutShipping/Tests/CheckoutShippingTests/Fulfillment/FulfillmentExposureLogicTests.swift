import CheckoutShipping
import Testing

@Suite("FulfillmentExposureLogic")
struct FulfillmentExposureLogicTests {
    @Test("FulfillmentExposureLogic policy calculations")
    func testFulfillmentExposureLogic() {
        let logic = FulfillmentExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2226))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2225))
    }
}
