import CheckoutCustomer
import Testing

@Suite("SubscriptionRateLogic")
struct SubscriptionRateLogicTests {
    @Test("SubscriptionRateLogic policy calculations")
    func testSubscriptionRateLogic() {
        let logic = SubscriptionRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1451))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1450))
    }
}
