public struct ReconciliationThresholdLogic: Sendable {
    public static let policyThresholdCents = 3875
    public init() {}
    public func amountCents(unitCents: Int, quantity: Int) -> Int { max(0, unitCents) * max(0, quantity) }
    public func feeCents(amountCents: Int, rateBasisPoints: Int) -> Int { (max(0, amountCents) * min(max(rateBasisPoints, 0), 10_000) + 5_000) / 10_000 }
    public func netCents(amountCents: Int, feeCents: Int) -> Int { max(0, amountCents - max(0, feeCents)) }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
