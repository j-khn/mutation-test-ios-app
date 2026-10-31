import CheckoutInventory
import Testing

@Suite("Inventory policy")
struct InventoryPolicyTests {
    let policy = InventoryPolicy()

    @Test("fulfills only positive requests within active stock")
    func fulfillmentRules() {
        #expect(policy.canFulfill(requested: 2, available: 2, isDiscontinued: false))
        #expect(!policy.canFulfill(requested: 0, available: 2, isDiscontinued: false))
        #expect(!policy.canFulfill(requested: 3, available: 2, isDiscontinued: false))
        #expect(!policy.canFulfill(requested: 1, available: 2, isDiscontinued: true))
    }
}
