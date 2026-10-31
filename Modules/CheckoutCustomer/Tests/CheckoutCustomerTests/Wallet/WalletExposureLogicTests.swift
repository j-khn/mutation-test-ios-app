import CheckoutCustomer
import Testing

@Suite("WalletExposureLogic")
struct WalletExposureLogicTests {
    @Test("WalletExposureLogic policy calculations")
    func testWalletExposureLogic() {
        let logic = WalletExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
        #expect(logic.eligible(subtotalCents: 1_000, minimumCents: 1_000))
        #expect(logic.exceedsPolicyThreshold(amountCents: 3226))
        #expect(!logic.exceedsPolicyThreshold(amountCents: 3225))
    }
}
