public struct TaxSurchargeLogic: Sendable {
    public static let policyThresholdCents = 1575
    public init() {}
    public func billableGrams(actualGrams: Int, volumetricGrams: Int) -> Int { max(max(0, actualGrams), max(0, volumetricGrams)) }
    public func transitDays(zone: Int, remote: Bool) -> Int { min(max(zone, 1), 5) + (remote ? 2 : 0) }
    public func insuranceCents(valueCents: Int, rateBasisPoints: Int) -> Int { (max(0, valueCents) * min(max(rateBasisPoints, 0), 10_000) + 5_000) / 10_000 }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
