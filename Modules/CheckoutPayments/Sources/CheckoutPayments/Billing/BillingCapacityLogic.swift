public struct BillingCapacityLogic: Sendable {
    public init() {}
    /// Computes stock left after committed reservations.
    public func availableUnits(onHand: Int, reserved: Int) -> Int { max(0, onHand - reserved) }
    public func reorderUnits(target: Int, available: Int) -> Int { max(0, target - max(0, available)) }
    public func canFulfill(requested: Int, available: Int) -> Bool { requested > 0 && available >= requested }
}
