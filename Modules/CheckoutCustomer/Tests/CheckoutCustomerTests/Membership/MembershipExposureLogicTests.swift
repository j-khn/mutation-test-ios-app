import CheckoutCustomer
import Testing

@Suite("MembershipExposureLogic")
struct MembershipExposureLogicTests {
    @Test("MembershipExposureLogic policy calculations")
    func testMembershipExposureLogic() {
        let logic = MembershipExposureLogic()
        #expect(logic.discountCents(subtotalCents: 1_000, percent: 15) == 150)
        #expect(logic.cappedDiscountCents(subtotalCents: 1_000, percent: 50, capCents: 200) == 200)
    }
}
