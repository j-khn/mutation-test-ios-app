import CheckoutPayments
import Testing

@Suite("BillingExposureLogic")
struct BillingExposureLogicTests {
    @Test("BillingExposureLogic policy calculations")
    func testBillingExposureLogic() {
        let logic = BillingExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
    }
}
