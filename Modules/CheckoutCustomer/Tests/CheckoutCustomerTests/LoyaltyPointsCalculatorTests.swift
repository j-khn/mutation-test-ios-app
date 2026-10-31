import CheckoutCustomer
import Testing

@Suite("Loyalty points")
struct LoyaltyPointsCalculatorTests {
    let calculator = LoyaltyPointsCalculator()

    @Test("earns one point per full eligible dollar")
    func earnsWholeDollarPoints() {
        #expect(calculator.pointsEarned(eligibleSpendCents: 299) == 2)
        #expect(calculator.pointsEarned(eligibleSpendCents: 300) == 3)
        #expect(calculator.pointsEarned(eligibleSpendCents: -100) == 0)
    }
}
