public struct InventoryPolicy: Sendable {
    public init() {}

    public func canFulfill(requested: Int, available: Int, isDiscontinued: Bool) -> Bool {
        guard !isDiscontinued else { return false }
        guard requested > 0 else { return false }
        return available >= requested
    }

    public func remainingStock(available: Int, reserved: Int) -> Int {
        let availableUnits = max(0, available)
        let reservedUnits = max(0, reserved)
        return availableUnits > reservedUnits ? availableUnits - reservedUnits : 0
    }
}
