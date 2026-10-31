import CheckoutPricing
import Testing

@Suite("TaxCapacityLogic")
struct TaxCapacityLogicTests {
    @Test("TaxCapacityLogic policy calculations")
    func testTaxCapacityLogic() {
        let logic = TaxCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1526))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1525))
    }
}
