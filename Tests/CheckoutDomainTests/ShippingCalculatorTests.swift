import CheckoutDomain
import Testing

@Suite("Shipping calculation")
struct ShippingCalculatorTests {
    let calculator = ShippingCalculator()

    @Test("waives shipping at the free-shipping threshold")
    func freeShippingThreshold() {
        #expect(calculator.feeCents(subtotalCents: 5_000, weightGrams: 500) == 0)
    }

    @Test("charges standard and heavy parcel fees")
    func parcelFees() {
        #expect(calculator.feeCents(subtotalCents: 4_999, weightGrams: 1_000) == 499)
        #expect(calculator.feeCents(subtotalCents: 4_999, weightGrams: 1_001) == 799)
        #expect(calculator.feeCents(subtotalCents: 4_999, weightGrams: 5_001) == 1_299)
    }
}
