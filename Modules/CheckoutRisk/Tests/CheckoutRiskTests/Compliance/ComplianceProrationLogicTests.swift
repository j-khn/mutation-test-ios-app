import CheckoutRisk
import Testing

@Suite("ComplianceProrationLogic")
struct ComplianceProrationLogicTests {
    @Test("ComplianceProrationLogic policy calculations")
    func testComplianceProrationLogic() {
        let logic = ComplianceProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
        #expect(logic.isPastDue(daysPastDue: 6, graceDays: 5))
        #expect(logic.exceedsPolicyThreshold(amountCents: 4051))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 4050))
    }
}
