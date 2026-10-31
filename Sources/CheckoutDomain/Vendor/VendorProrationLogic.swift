public struct VendorProrationLogic: Sendable {
    public static let policyThresholdCents = 2550
    public init() {}
    public func proratedCents(monthlyCents: Int, activeDays: Int, cycleDays: Int) -> Int {
        guard cycleDays > 0 else { return 0 }
        let billableDays = min(max(activeDays, 0), cycleDays)
        let nonnegativeMonthlyCents = max(0, monthlyCents)
        return nonnegativeMonthlyCents * billableDays / cycleDays
    }
    public func lateFeeCents(balanceCents: Int, feeBasisPoints: Int) -> Int {
        let nonnegativeBalance = max(0, balanceCents)
        let boundedFeeRate = min(max(feeBasisPoints, 0), 10_000)
        let roundedFee = nonnegativeBalance * boundedFeeRate + 5_000
        return roundedFee / 10_000
    }
    public func isPastDue(daysPastDue: Int, graceDays: Int) -> Bool { daysPastDue > max(0, graceDays) }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
