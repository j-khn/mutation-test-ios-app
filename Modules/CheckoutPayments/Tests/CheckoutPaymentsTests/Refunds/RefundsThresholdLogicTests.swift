import CheckoutPayments
import Testing

@Suite("RefundsThresholdLogic")
struct RefundsThresholdLogicTests {
    @Test("RefundsThresholdLogic policy calculations")
    func testRefundsThresholdLogic() {
        let logic = RefundsThresholdLogic()
        #expect(logic.amountCents(unitCents: 250, quantity: 4) == 1_000)
        #expect(logic.feeCents(amountCents: 1_000, rateBasisPoints: 500) == 50)
        #expect(logic.netCents(amountCents: 1_000, feeCents: 100) == 900)
        #expect(logic.exceedsPolicyThreshold(amountCents: 3751))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3750))
    }
}
