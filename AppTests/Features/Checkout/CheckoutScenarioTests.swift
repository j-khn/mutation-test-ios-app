import Testing
@testable import MutationTestIOSApp

@MainActor
@Suite("Checkout scenarios")
struct CheckoutScenarioTests {
    @Test("combines receipt, shipping, and loyalty calculations")
    func defaultCheckout() throws {
        let model = CheckoutViewModel()
        model.calculate()
        let receipt = try #require(model.receipt)
        #expect(receipt.subtotalCents == 3_998)
        #expect(receipt.discountCents == 400)
        #expect(receipt.taxCents == 297)
        #expect(model.shippingCents == 499)
        #expect(model.payableCents == 4_394)
        #expect(model.points == 35)
        #expect(model.errorMessage == nil)
    }

    @Test("recalculates when the quantity changes")
    func changedQuantity() throws {
        let model = CheckoutViewModel()
        model.quantity = 3
        model.calculate()
        let receipt = try #require(model.receipt)
        #expect(receipt.subtotalCents == 5_997)
        #expect(model.shippingCents == 0)
        #expect(model.points == 53)
    }

    @Test("shows an error for a zero quantity")
    func zeroQuantity() {
        let model = CheckoutViewModel()
        model.quantity = 0
        model.calculate()
        #expect(model.receipt == nil)
        #expect(model.errorMessage != nil)
    }

    @Test("shows an error when quantity exceeds available stock")
    func exceedsStock() {
        let model = CheckoutViewModel()
        model.quantity = 21
        model.calculate()
        #expect(model.receipt == nil)
        #expect(model.errorMessage == "Choose a quantity between 1 and the available stock.")
    }

    @Test("handles a full discount in the checkout screen model")
    func fullDiscount() throws {
        let model = CheckoutViewModel()
        model.discountPercent = 100
        model.calculate()
        let receipt = try #require(model.receipt)
        #expect(receipt.totalCents == 0)
        #expect(model.points == 0)
        #expect(model.payableCents == 499)
    }

    @Test("reports an invalid discount without keeping a receipt")
    func invalidDiscount() {
        let model = CheckoutViewModel()
        model.discountPercent = 101
        model.calculate()
        #expect(model.receipt == nil)
        #expect(model.errorMessage != nil)
    }

    @Test("reports an invalid tax rate without keeping a receipt")
    func invalidTaxRate() {
        let model = CheckoutViewModel()
        model.taxBasisPoints = 10_001
        model.calculate()
        #expect(model.receipt == nil)
        #expect(model.errorMessage != nil)
    }

    @Test("clears an inventory error after the quantity is corrected")
    func clearsPreviousError() throws {
        let model = CheckoutViewModel()
        model.quantity = 0
        model.calculate()
        #expect(model.errorMessage != nil)

        model.quantity = 1
        model.calculate()
        let receipt = try #require(model.receipt)
        #expect(receipt.subtotalCents == 1_999)
        #expect(model.errorMessage == nil)
    }
}
