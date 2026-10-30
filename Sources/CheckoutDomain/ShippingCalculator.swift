public struct ShippingCalculator: Sendable {
    public init() {}

    public func feeCents(subtotalCents: Int, weightGrams: Int) -> Int {
        guard subtotalCents < 5_000 else { return 0 }
        let baseFee = weightGrams <= 1_000 ? 499 : 799
        let heavySurcharge = weightGrams > 5_000 ? 500 : 0
        return baseFee + heavySurcharge
    }
}
