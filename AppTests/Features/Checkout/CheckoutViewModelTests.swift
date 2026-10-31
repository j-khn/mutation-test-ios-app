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

    @Test("qualifying orders get free shipping")
    func freeShipping() {
        let model = CheckoutViewModel()
        model.quantity = 3
        model.calculate()
        #expect(model.receipt != nil)
        #expect(model.shippingCents == 0)
        #expect(model.payableCents == model.receipt?.totalCents)
    }

    @Test("out-of-stock recalculation clears the previous receipt")
    func invalidStockClearsResult() {
        let model = CheckoutViewModel()
        model.calculate()
        model.availableStock = 1
        model.calculate()
        #expect(model.receipt == nil)
        #expect(model.errorMessage != nil)
        #expect(model.shippingCents == 0)
        #expect(model.points == 0)
        #expect(model.payableCents == 0)
    }

    @Test("invalid pricing values produce an app error")
    func invalidDiscount() {
        let model = CheckoutViewModel()
        model.discountPercent = 101
        model.calculate()
        #expect(model.receipt == nil)
        #expect(model.errorMessage != nil)
    }
}
