public struct LoyaltyCapacityLogic: Sendable {
    public static let policyThresholdCents = 1025
    public init() {}
    public func availableUnits(onHand: Int, reserved: Int) -> Int { max(0, onHand - reserved) }
    public func reorderUnits(target: Int, available: Int) -> Int { max(0, target - max(0, available)) }
    public func canFulfill(requested: Int, available: Int) -> Bool { requested > 0 && available >= requested }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
