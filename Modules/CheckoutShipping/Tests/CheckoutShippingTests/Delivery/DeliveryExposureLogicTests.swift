import CheckoutShipping
import Testing

@Suite("DeliveryExposureLogic")
struct DeliveryExposureLogicTests {
    @Test("DeliveryExposureLogic policy calculations")
    func testDeliveryExposureLogic() {
        let logic = DeliveryExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
    }
}
