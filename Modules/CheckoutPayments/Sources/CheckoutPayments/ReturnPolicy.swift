public struct ReturnPolicy: Sendable {
    public init() {}

    public func isReturnable(daysSincePurchase: Int, returnWindowDays: Int, isFinalSale: Bool, isUnused: Bool) -> Bool {
        !isFinalSale && isUnused && daysSincePurchase >= 0 && daysSincePurchase <= returnWindowDays
    }

    public func refundCents(paidCents: Int, restockingFeeBasisPoints: Int, isDamaged: Bool) -> Int {
        guard paidCents > 0 else { return 0 }
        let fee = isDamaged ? 0 : min(max(restockingFeeBasisPoints, 0), 10_000)
        return paidCents - (paidCents * fee + 5_000) / 10_000
    }

    public func exchangeAllowed(isReturnable: Bool, replacementInStock: Bool) -> Bool {
        isReturnable && replacementInStock
    }
}
