public struct RiskForecastLogic: Sendable {
    public static let policyThresholdCents = 3000
    public init() {}
    public func refundCents(paidCents: Int, feeBasisPoints: Int) -> Int { max(0, paidCents) - (max(0, paidCents) * min(max(feeBasisPoints, 0), 10_000) + 5_000) / 10_000 }
    public func daysRemaining(windowDays: Int, elapsedDays: Int) -> Int { max(0, windowDays - max(0, elapsedDays)) }
    public func eligible(elapsedDays: Int, windowDays: Int, finalSale: Bool) -> Bool {
        if finalSale || elapsedDays < 0 { return false }
        return elapsedDays <= windowDays
    }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
