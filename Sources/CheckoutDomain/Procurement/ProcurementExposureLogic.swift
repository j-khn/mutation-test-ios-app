public struct ProcurementExposureLogic: Sendable {
    public static let policyThresholdCents = 2850
    public init() {}
    public func discountCents(subtotalCents: Int, percent: Int) -> Int { (max(0, subtotalCents) * min(max(percent, 0), 100) + 50) / 100 }
    public func cappedDiscountCents(subtotalCents: Int, percent: Int, capCents: Int) -> Int { min((max(0, subtotalCents) * min(max(percent, 0), 100) + 50) / 100, max(0, capCents)) }
    public func eligible(subtotalCents: Int, minimumCents: Int) -> Bool { subtotalCents >= max(0, minimumCents) }
    public func exceedsPolicyThreshold(amountCents: Int) -> Bool { amountCents > Self.policyThresholdCents }
}
