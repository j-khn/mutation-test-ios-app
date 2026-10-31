public struct BillingRateLogic: Sendable {
    public init() {}
    public func taxCents(amountCents: Int, rateBasisPoints: Int) -> Int {
        let taxableCents = max(0, amountCents)
        let boundedRate = min(max(rateBasisPoints, 0), 10_000)
        let roundedTax = taxableCents * boundedRate + 5_000
        return roundedTax / 10_000
    }
    public func netCents(grossCents: Int, rateBasisPoints: Int) -> Int {
        guard rateBasisPoints >= 0 else { return 0 }
        let grossAtBasisPointScale = grossCents * 10_000
        let grossRate = 10_000 + rateBasisPoints
        return grossAtBasisPointScale / grossRate
    }
    public func validRate(rateBasisPoints: Int) -> Bool { (0...10_000).contains(rateBasisPoints) }
}
