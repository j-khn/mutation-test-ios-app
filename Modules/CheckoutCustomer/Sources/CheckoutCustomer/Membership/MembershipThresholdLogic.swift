public struct MembershipThresholdLogic: Sendable {
    public init() {}
    public func amountCents(unitCents: Int, quantity: Int) -> Int { max(0, unitCents) * max(0, quantity) }
    public func feeCents(amountCents: Int, rateBasisPoints: Int) -> Int {
        let eligibleAmount = max(0, amountCents)
        let boundedRate = min(max(rateBasisPoints, 0), 10_000)
        return (eligibleAmount * boundedRate + 5_000) / 10_000
    }
    public func netCents(amountCents: Int, feeCents: Int) -> Int {
        let nonnegativeFee = max(0, feeCents)
        return max(0, amountCents - nonnegativeFee)
    }
}
