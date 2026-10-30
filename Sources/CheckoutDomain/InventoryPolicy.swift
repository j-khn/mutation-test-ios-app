public struct InventoryPolicy: Sendable {
    public init() {}

    public func canFulfill(requested: Int, available: Int, isDiscontinued: Bool) -> Bool {
        requested > 0 && available >= requested && !isDiscontinued
    }

    public func remainingStock(available: Int, reserved: Int) -> Int {
        max(0, available - reserved)
    }
}
