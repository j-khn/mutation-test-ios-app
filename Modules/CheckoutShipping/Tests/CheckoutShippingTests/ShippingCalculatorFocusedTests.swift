import CheckoutShipping
import Testing

@Suite("Shipping fees")
struct ShippingCalculatorFocusedTests {
    let calculator = ShippingCalculator()

    @Test("charges the light parcel fee below the free-shipping threshold")
    func lightParcelFee() {
        #expect(calculator.feeCents(subtotalCents: 4_999, weightGrams: 750) == 499)
    }

    @Test("waives shipping at the free-shipping threshold")
    func thresholdIsFree() {
        #expect(calculator.feeCents(subtotalCents: 5_000, weightGrams: 750) == 0)
    }

    @Test("waives shipping above the free-shipping threshold")
    func aboveThresholdIsFree() {
        #expect(calculator.feeCents(subtotalCents: 5_001, weightGrams: 6_000) == 0)
    }

    @Test("uses the light fee through one thousand grams")
    func lightWeightBoundary() {
        #expect(calculator.feeCents(subtotalCents: 1_000, weightGrams: 1_000) == 499)
    }

    @Test("uses the heavier base fee above one thousand grams")
    func heavierBaseFee() {
        #expect(calculator.feeCents(subtotalCents: 1_000, weightGrams: 1_001) == 799)
    }

    @Test("does not add the heavy surcharge at five thousand grams")
    func heavySurchargeBoundary() {
        #expect(calculator.feeCents(subtotalCents: 1_000, weightGrams: 5_000) == 799)
    }

    @Test("adds the heavy surcharge above five thousand grams")
    func heavySurcharge() {
        #expect(calculator.feeCents(subtotalCents: 1_000, weightGrams: 5_001) == 1_299)
    }

    @Test("treats negative weight as a zero-weight parcel")
    func negativeWeight() {
        #expect(calculator.feeCents(subtotalCents: 1_000, weightGrams: -1) == 499)
    }

    @Test("handles the largest parcel weight without overflow")
    func largestWeight() {
        #expect(calculator.feeCents(subtotalCents: 1_000, weightGrams: Int.max) == 1_299)
    }
}
