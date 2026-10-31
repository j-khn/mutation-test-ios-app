import CheckoutCustomer
import Testing

@Suite("Loyalty point rules")
struct LoyaltyPointsFocusedTests {
    let calculator = LoyaltyPointsCalculator()

    @Test("earns one point per full eligible dollar")
    func earnsWholeDollarPoints() {
        #expect(calculator.pointsEarned(eligibleSpendCents: 299) == 2)
        #expect(calculator.pointsEarned(eligibleSpendCents: 300) == 3)
    }

    @Test("does not round a partial dollar up")
    func floorsPartialDollar() {
        #expect(calculator.pointsEarned(eligibleSpendCents: 99) == 0)
        #expect(calculator.pointsEarned(eligibleSpendCents: 199) == 1)
    }

    @Test("earns no points for zero spend")
    func zeroSpend() {
        #expect(calculator.pointsEarned(eligibleSpendCents: 0) == 0)
    }

    @Test("clamps negative spend to zero points")
    func negativeSpend() {
        #expect(calculator.pointsEarned(eligibleSpendCents: -100) == 0)
    }

    @Test("handles the largest integer spend")
    func largestSpend() {
        #expect(calculator.pointsEarned(eligibleSpendCents: Int.max) == Int.max / 100)
    }

    @Test("converts redeemable points to cents")
    func redemptionValue() {
        #expect(calculator.redemptionValueCents(points: 10, availableBalance: 10) == 20)
    }

    @Test("allows redemption below the available balance")
    func redemptionBelowBalance() {
        #expect(calculator.redemptionValueCents(points: 3, availableBalance: 8) == 6)
    }

    @Test("rejects zero points")
    func rejectsZeroRedemption() {
        #expect(calculator.redemptionValueCents(points: 0, availableBalance: 8) == nil)
    }

    @Test("rejects negative points")
    func rejectsNegativeRedemption() {
        #expect(calculator.redemptionValueCents(points: -1, availableBalance: 8) == nil)
    }

    @Test("rejects insufficient or overflowing balances")
    func rejectsInvalidBalances() {
        #expect(calculator.redemptionValueCents(points: 9, availableBalance: 8) == nil)
        #expect(calculator.redemptionValueCents(points: Int.max, availableBalance: Int.max) == nil)
    }
}
