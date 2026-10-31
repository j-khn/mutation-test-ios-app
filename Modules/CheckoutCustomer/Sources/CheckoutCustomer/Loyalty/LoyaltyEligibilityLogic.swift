public struct LoyaltyEligibilityLogic: Sendable {
    public init() {}
    public func cycleChargeCents(monthlyCents: Int, cycles: Int) -> Int { max(0, monthlyCents) * max(0, cycles) }
    public func trialDaysRemaining(trialDays: Int, elapsedDays: Int) -> Int { max(0, trialDays - max(0, elapsedDays)) }
    public func shouldRenew(isActive: Bool, paymentValid: Bool) -> Bool { isActive && paymentValid }
}
