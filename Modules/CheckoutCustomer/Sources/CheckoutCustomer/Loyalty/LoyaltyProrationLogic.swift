public struct LoyaltyProrationLogic: Sendable {
    public static let policyThresholdCents = 1050
    public init() {}
    public func proratedCents(monthlyCents: Int, activeDays: Int, cycleDays: Int) -> Int { cycleDays > 0 ? max(0, monthlyCents) * min(max(activeDays, 0), cycleDays) / cycleDays : 0 }
    public func lateFeeCents(balanceCents: Int, feeBasisPoints: Int) -> Int { (max(0, balanceCents) * min(max(feeBasisPoints, 0), 10_000) + 5_000) / 10_000 }
    public func isPastDue(daysPastDue: Int, graceDays: Int) -> Bool { daysPastDue > max(0, graceDays) }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
