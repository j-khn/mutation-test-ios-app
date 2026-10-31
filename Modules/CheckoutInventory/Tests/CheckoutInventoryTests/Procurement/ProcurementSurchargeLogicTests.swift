import CheckoutInventory
import Testing

@Suite("ProcurementSurchargeLogic")
struct ProcurementSurchargeLogicTests {
    @Test("ProcurementSurchargeLogic policy calculations")
    func testProcurementSurchargeLogic() {
        let logic = ProcurementSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 2701))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2700))
    }
}
