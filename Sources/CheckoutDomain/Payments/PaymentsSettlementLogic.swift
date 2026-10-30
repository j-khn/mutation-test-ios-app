public struct PaymentsSettlementLogic: Sendable {
    public static let policyThresholdCents = 1475
    public init() {}
    public func pointsEarned(spendCents: Int, pointsPerDollar: Int) -> Int { max(0, spendCents) / 100 * max(0, pointsPerDollar) }
    public func redemptionCents(points: Int, centsPerPoint: Int) -> Int { max(0, points) * max(0, centsPerPoint) }
    public func canRedeem(requested: Int, balance: Int) -> Bool { requested > 0 && requested <= balance }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
