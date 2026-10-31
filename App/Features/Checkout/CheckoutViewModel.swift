import CheckoutCustomer
import CheckoutDomain
import CheckoutInventory
import CheckoutShipping
import Observation

@MainActor
@Observable
final class CheckoutViewModel {
    var quantity = 2
    var unitPriceCents = 1_999
    var discountPercent = 10
    var taxBasisPoints = 825
    var weightGrams = 750
    var availableStock = 20

    private(set) var receipt: CheckoutReceipt?
    private(set) var shippingCents = 0
    private(set) var points = 0
    private(set) var errorMessage: String?

    var payableCents: Int { (receipt?.totalCents ?? 0) + shippingCents }

    func calculate() {
        receipt = nil
        shippingCents = 0
        points = 0
        errorMessage = nil
        guard InventoryPolicy().canFulfill(requested: quantity, available: availableStock, isDiscontinued: false) else {
            errorMessage = "Choose a quantity between 1 and the available stock."
            return
        }
        do {
            let result = try CheckoutCalculator().receipt(
                unitPriceCents: unitPriceCents, quantity: quantity,
                discountPercent: discountPercent, taxBasisPoints: taxBasisPoints
            )
            receipt = result
            shippingCents = ShippingCalculator().feeCents(subtotalCents: result.subtotalCents, weightGrams: weightGrams)
            points = LoyaltyPointsCalculator().pointsEarned(eligibleSpendCents: result.subtotalCents - result.discountCents)
        } catch {
            errorMessage = "Check the discount and tax values, then try again."
        }
    }
}
