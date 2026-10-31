import CheckoutPayments
import Testing

@Suite("RefundsSurchargeLogic")
struct RefundsSurchargeLogicTests {
    @Test("RefundsSurchargeLogic policy calculations")
    func testRefundsSurchargeLogic() {
        let logic = RefundsSurchargeLogic()
        #expect(logic.billableGrams(actualGrams: 900, volumetricGrams: 1_200) == 1_200)
        #expect(logic.transitDays(zone: 3, remote: true) == 5)
        #expect(logic.insuranceCents(valueCents: 10_000, rateBasisPoints: 100) == 100)
        #expect(logic.exceedsPolicyThreshold(amountCents: 3826))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3825))
    }
}
