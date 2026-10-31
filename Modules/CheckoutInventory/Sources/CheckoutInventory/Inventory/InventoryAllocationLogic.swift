public struct InventoryAllocationLogic: Sendable {
    public init() {}
    public func settledCents(capturedCents: Int, refundedCents: Int) -> Int { max(0, capturedCents - max(0, refundedCents)) }
    public func processingFeeCents(amountCents: Int, feeBasisPoints: Int) -> Int { (max(0, amountCents) * min(max(feeBasisPoints, 0), 2_000) + 5_000) / 10_000 }
    public func isWithinLimit(amountCents: Int, limitCents: Int) -> Bool { amountCents >= 0 && amountCents <= limitCents }
}
