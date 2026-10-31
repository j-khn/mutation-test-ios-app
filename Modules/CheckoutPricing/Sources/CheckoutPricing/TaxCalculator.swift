public struct TaxCalculator: Sendable {
    public init() {}

    public func taxCents(amountCents: Int, rateBasisPoints: Int) -> Int {
        guard amountCents > 0, rateBasisPoints > 0 else { return 0 }
        return (amountCents * rateBasisPoints + 5_000) / 10_000
    }

    public func taxExclusiveAmount(inclusiveCents: Int, rateBasisPoints: Int) -> Int {
        guard inclusiveCents > 0, rateBasisPoints >= 0 else { return 0 }
        return (inclusiveCents * 10_000 + (10_000 + rateBasisPoints) / 2) / (10_000 + rateBasisPoints)
    }

    public func isValidRate(_ rateBasisPoints: Int) -> Bool {
        (0...10_000).contains(rateBasisPoints)
    }
}
