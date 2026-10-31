import CheckoutPricing
import Testing

@Suite("PricingProrationLogic")
struct PricingProrationLogicTests {
    @Test("PricingProrationLogic policy calculations")
    func testPricingProrationLogic() {
        let logic = PricingProrationLogic()
        #expect(logic.proratedCents(monthlyCents: 3_100, activeDays: 15, cycleDays: 31) == 1_500)
        #expect(logic.lateFeeCents(balanceCents: 10_000, feeBasisPoints: 500) == 500)
    }
}
