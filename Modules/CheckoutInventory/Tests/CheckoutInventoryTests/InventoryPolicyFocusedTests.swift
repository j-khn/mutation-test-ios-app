import CheckoutInventory
import Testing

@Suite("Inventory policy")
struct InventoryPolicyFocusedTests {
    let policy = InventoryPolicy()

    @Test("fulfills a request equal to available stock")
    func exactStock() {
        #expect(policy.canFulfill(requested: 4, available: 4, isDiscontinued: false))
    }

    @Test("fulfills a request below available stock")
    func requestBelowStock() {
        #expect(policy.canFulfill(requested: 3, available: 5, isDiscontinued: false))
    }

    @Test("rejects a zero request")
    func rejectsZeroRequest() {
        #expect(!policy.canFulfill(requested: 0, available: 5, isDiscontinued: false))
    }

    @Test("rejects a negative request")
    func rejectsNegativeRequest() {
        #expect(!policy.canFulfill(requested: -1, available: 5, isDiscontinued: false))
    }

    @Test("rejects requests greater than available stock")
    func requestExceedsStock() {
        #expect(!policy.canFulfill(requested: 6, available: 5, isDiscontinued: false))
    }

    @Test("rejects discontinued items")
    func discontinuedItem() {
        #expect(!policy.canFulfill(requested: 1, available: 5, isDiscontinued: true))
    }

    @Test("rejects stock below zero")
    func negativeAvailableStock() {
        #expect(!policy.canFulfill(requested: 1, available: -1, isDiscontinued: false))
    }

    @Test("subtracts reserved stock")
    func subtractsReservations() {
        #expect(policy.remainingStock(available: 9, reserved: 4) == 5)
    }

    @Test("returns zero when all stock is reserved")
    func allStockReserved() {
        #expect(policy.remainingStock(available: 4, reserved: 4) == 0)
    }

    @Test("clamps over-reserved and negative values safely")
    func clampsInvalidStockValues() {
        #expect(policy.remainingStock(available: 3, reserved: 5) == 0)
        #expect(policy.remainingStock(available: -3, reserved: -2) == 0)
        #expect(policy.remainingStock(available: Int.max, reserved: Int.min) == Int.max)
    }
}
