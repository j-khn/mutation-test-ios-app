import CheckoutCustomer
import Testing

@Suite("WalletCapacityLogic")
struct WalletCapacityLogicTests {
    @Test("WalletCapacityLogic policy calculations")
    func testWalletCapacityLogic() {
        let logic = WalletCapacityLogic()
        #expect(logic.availableUnits(onHand: 20, reserved: 7) == 13)
        #expect(logic.reorderUnits(target: 25, available: 13) == 12)
        #expect(logic.canFulfill(requested: 3, available: 3))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3026))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3025))
    }
}
