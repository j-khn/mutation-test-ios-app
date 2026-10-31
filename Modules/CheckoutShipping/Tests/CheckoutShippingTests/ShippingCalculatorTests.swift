import CheckoutShipping
import Testing

@Suite("Shipping calculation")
struct ShippingCalculatorTests {
    let calculator = ShippingCalculator()

    @Test("waives shipping at the free-shipping threshold")
    func freeShippingThreshold() {
        #expect(calculator.feeCents(subtotalCents: 5_000, weightGrams: 500) == 0)
    }
}
