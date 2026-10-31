import CheckoutInventory
import Testing

@Suite("InventorySurchargeLogic")
struct InventorySurchargeLogicTests {
    @Test("InventorySurchargeLogic policy calculations")
    func testInventorySurchargeLogic() {
        let logic = InventorySurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
    }
}
