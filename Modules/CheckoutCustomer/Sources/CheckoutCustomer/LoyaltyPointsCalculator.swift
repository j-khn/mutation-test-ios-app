public struct LoyaltyPointsCalculator: Sendable {
    public init() {}

    public func pointsEarned(eligibleSpendCents: Int) -> Int {
        max(0, eligibleSpendCents) / 100
    }

    public func redemptionValueCents(points: Int, availableBalance: Int) -> Int? {
        guard points > 0, points <= availableBalance, points <= Int.max / 2 else { return nil }
        return points * 2
    }
}
