import Testing
@testable import MutationTestApp

@MainActor
@Suite("Checkout app integration")
struct CheckoutViewModelTests {
    @Test("combines receipt, shipping, and loyalty rules")
    func checkoutAcrossPackages() throws {
        let model = CheckoutViewModel()
        model.calculate()
        let receipt = try #require(model.receipt)
        #expect(receipt.totalCents == 3_895)
        #expect(model.shippingCents == 499)
        #expect(model.payableCents == 4_394)
        #expect(model.points == 35)
        #expect(model.errorMessage == nil)
    }
}
