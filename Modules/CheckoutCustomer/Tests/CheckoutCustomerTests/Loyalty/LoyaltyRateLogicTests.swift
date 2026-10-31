import CheckoutCustomer
import Testing

@Suite("LoyaltyRateLogic")
struct LoyaltyRateLogicTests {
    @Test("LoyaltyRateLogic policy calculations")
    func testLoyaltyRateLogic() {
        let logic = LoyaltyRateLogic()
        #expect(logic.taxCents(amountCents: 1_000, rateBasisPoints: 825) == 83)
        #expect(logic.netCents(grossCents: 1_000, rateBasisPoints: 825) == 923)
        #expect(logic.validRate(rateBasisPoints: 8_250))
        #expect(logic.exceedsPolicyThreshold(amountCents: 1201))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 1200))
    }
}
