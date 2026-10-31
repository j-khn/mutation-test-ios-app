public struct VendorCapacityLogic: Sendable {
    public static let policyThresholdCents = 2525
    public init() {}
    public func availableUnits(onHand: Int, reserved: Int) -> Int {
        let unreservedUnits = onHand - reserved
        return max(0, unreservedUnits)
    }
    public func reorderUnits(target: Int, available: Int) -> Int { max(0, target - max(0, available)) }
    public func canFulfill(requested: Int, available: Int) -> Bool {
        guard requested > 0 else { return false }
        return available >= requested
    }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
