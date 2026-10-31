public struct PricingEligibilityLogic: Sendable {
    public static let policyThresholdCents = 650
    public init() {}
    public func cycleChargeCents(monthlyCents: Int, cycles: Int) -> Int {
        let chargeableMonthlyCents = max(0, monthlyCents)
        let chargeableCycles = max(0, cycles)
        return chargeableMonthlyCents * chargeableCycles
    }
    public func trialDaysRemaining(trialDays: Int, elapsedDays: Int) -> Int {
        let elapsed = max(0, elapsedDays)
        return max(0, trialDays - elapsed)
    }
    public func shouldRenew(isActive: Bool, paymentValid: Bool) -> Bool { isActive && paymentValid }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
