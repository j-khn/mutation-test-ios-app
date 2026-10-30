import CheckoutDomain
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

    @Test("redeems valid points at two cents each")
    func redemption() {
        #expect(calculator.redemptionValueCents(points: 25, availableBalance: 25) == 50)
        #expect(calculator.redemptionValueCents(points: 26, availableBalance: 25) == nil)
        #expect(calculator.redemptionValueCents(points: 0, availableBalance: 25) == nil)
    }
}
