import CheckoutShipping
import Testing

@Suite("DeliveryRateLogic")
struct DeliveryRateLogicTests {
    @Test("DeliveryRateLogic policy calculations")
    func testDeliveryRateLogic() {
        let logic = DeliveryRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
    }
}
