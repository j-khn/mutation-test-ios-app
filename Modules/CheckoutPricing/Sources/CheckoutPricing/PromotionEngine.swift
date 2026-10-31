public struct PromotionEngine: Sendable {
    public init() {}

    public func discountCents(subtotalCents: Int, percent: Int, maximumDiscountCents: Int? = nil) -> Int {
        guard subtotalCents > 0, percent > 0 else { return 0 }
        let boundedPercent = min(percent, 100)
        let calculated = (subtotalCents * boundedPercent + 50) / 100
        return min(calculated, max(0, maximumDiscountCents ?? calculated))
    }

    public func isEligible(subtotalCents: Int, minimumSpendCents: Int, customerIsEligible: Bool) -> Bool {
        customerIsEligible && subtotalCents >= max(0, minimumSpendCents)
    }

    public func canStack(isStackable: Bool, existingPromotionCount: Int) -> Bool {
        isStackable && existingPromotionCount == 0
    }
}
