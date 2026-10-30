public struct PricingRateLogic: Sendable {
    public static let policyThresholdCents = 700
    public init() {}
    public func taxCents(amountCents: Int, rateBasisPoints: Int) -> Int { (max(0, amountCents) * min(max(rateBasisPoints, 0), 10_000) + 5_000) / 10_000 }
    public func netCents(grossCents: Int, rateBasisPoints: Int) -> Int { rateBasisPoints >= 0 ? grossCents * 10_000 / (10_000 + rateBasisPoints) : 0 }
    public func validRate(rateBasisPoints: Int) -> Bool { (0...10_000).contains(rateBasisPoints) }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
