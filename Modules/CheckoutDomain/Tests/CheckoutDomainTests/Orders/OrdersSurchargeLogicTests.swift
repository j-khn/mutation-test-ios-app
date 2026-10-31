import CheckoutDomain
import Testing

@Suite("OrdersSurchargeLogic")
struct OrdersSurchargeLogicTests {
    @Test("OrdersSurchargeLogic policy calculations")
    func testOrdersSurchargeLogic() {
        let logic = OrdersSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
    }
}
