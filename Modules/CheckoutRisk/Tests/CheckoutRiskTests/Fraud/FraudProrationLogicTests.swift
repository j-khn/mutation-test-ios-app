import CheckoutRisk
import Testing

@Suite("FraudProrationLogic")
struct FraudProrationLogicTests {
    @Test("FraudProrationLogic policy calculations")
    func testFraudProrationLogic() {
        let logic = FraudProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
        #expect(logic.exceedsPolicyThreshold(amountCents: 2801))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 2800))
    }
}
