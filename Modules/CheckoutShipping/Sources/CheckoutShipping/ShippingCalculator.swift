public struct ShippingCalculator: Sendable {
    public init() {}

    /// Applies the free-shipping threshold before calculating parcel surcharges.
    public func feeCents(subtotalCents: Int, weightGrams: Int) -> Int {
        guard subtotalCents < 5_000 else { return 0 }
        let billableWeightGrams = weightGrams > 0 ? weightGrams : 0
        let baseFee = billableWeightGrams <= 1_000 ? 499 : 799
        let heavySurcharge = billableWeightGrams > 5_000 ? 500 : 0
        return baseFee + heavySurcharge
    }
}
