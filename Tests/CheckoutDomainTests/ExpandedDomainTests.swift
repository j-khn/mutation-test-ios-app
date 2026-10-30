import CheckoutDomain
import Testing

@Suite("Expanded checkout rules")
struct ExpandedDomainTests {
    @Test("calculates percentage discounts across subtotals", arguments: Array(1...300))
    func discounts(subtotal: Int) {
        let cents = subtotal * 100
        #expect(PromotionEngine().discountCents(subtotalCents: cents, percent: 15) == cents * 15 / 100)
    }

    @Test("applies promotion caps", arguments: Array(1...300))
    func discountCaps(subtotal: Int) {
        let cents = subtotal * 100
        let cap = subtotal * 7
        #expect(PromotionEngine().discountCents(subtotalCents: cents, percent: 30, maximumDiscountCents: cap) == min(cents * 30 / 100, cap))
    }

    @Test("checks promotion minimum spend", arguments: Array(0...200))
    func promotionEligibility(spend: Int) {
        #expect(PromotionEngine().isEligible(subtotalCents: spend, minimumSpendCents: 100, customerIsEligible: true) == (spend >= 100))
        #expect(!PromotionEngine().isEligible(subtotalCents: spend, minimumSpendCents: 100, customerIsEligible: false))
    }

    @Test("calculates tax across basis point rates", arguments: Array(stride(from: 0, through: 10_000, by: 50)))
    func taxRates(rate: Int) {
        let amount = 10_000
        #expect(TaxCalculator().taxCents(amountCents: amount, rateBasisPoints: rate) == (amount * rate + 5_000) / 10_000)
        #expect(TaxCalculator().isValidRate(rate))
    }

    @Test("rejects tax rates outside the supported range", arguments: [-10_000, -1, 10_001, 20_000])
    func invalidTaxRates(rate: Int) {
        #expect(!TaxCalculator().isValidRate(rate))
    }

    @Test("extracts tax from inclusive prices", arguments: Array(1...300))
    func taxInclusiveAmounts(amount: Int) {
        let cents = amount * 100
        let net = TaxCalculator().taxExclusiveAmount(inclusiveCents: cents, rateBasisPoints: 2_000)
        #expect(net <= cents)
        #expect(net > 0)
        #expect(net + TaxCalculator().taxCents(amountCents: net, rateBasisPoints: 2_000) >= cents - 1)
    }

    @Test("enforces return-window boundaries", arguments: Array(0...300))
    func returnWindow(days: Int) {
        #expect(ReturnPolicy().isReturnable(daysSincePurchase: days, returnWindowDays: 30, isFinalSale: false, isUnused: true) == (days <= 30))
    }

    @Test("calculates refunds after restocking fees", arguments: Array(stride(from: 0, through: 10_000, by: 100)))
    func restockingFees(rate: Int) {
        let paid = 10_000
        #expect(ReturnPolicy().refundCents(paidCents: paid, restockingFeeBasisPoints: rate, isDamaged: false) == paid - (paid * rate + 5_000) / 10_000)
        #expect(ReturnPolicy().refundCents(paidCents: paid, restockingFeeBasisPoints: rate, isDamaged: true) == paid)
    }

    @Test("requires both return eligibility and replacement stock", arguments: [false, true])
    func exchanges(returnable: Bool) {
        #expect(ReturnPolicy().exchangeAllowed(isReturnable: returnable, replacementInStock: true) == returnable)
        #expect(!ReturnPolicy().exchangeAllowed(isReturnable: returnable, replacementInStock: false))
    }

    @Test("allows only one stackable promotion", arguments: Array(0...300))
    func promotionStacking(existingCount: Int) {
        #expect(PromotionEngine().canStack(isStackable: true, existingPromotionCount: existingCount) == (existingCount == 0))
        #expect(!PromotionEngine().canStack(isStackable: false, existingPromotionCount: existingCount))
    }

    @Test("estimates delivery across zones, cutoff times, and remote addresses", arguments: Array(0...300))
    func deliveryEstimates(index: Int) {
        let zone = index % 6
        let hour = index % 24
        let remote = index.isMultiple(of: 2)
        let days = DeliveryEstimator().estimatedBusinessDays(zone: zone, orderedHour: hour, isRemoteArea: remote)
        #expect((1...7).contains(days))
        #expect(days == min(max(zone, 1), 4) + (hour >= 14 ? 1 : 0) + (remote ? 2 : 0))
    }

    @Test("applies expedited delivery eligibility rules", arguments: Array(0...300))
    func expeditedEligibility(index: Int) {
        let zone = index % 5
        let spend = index * 25
        let remote = index.isMultiple(of: 3)
        #expect(DeliveryEstimator().isExpeditedEligible(subtotalCents: spend, zone: zone, isRemoteArea: remote) == (spend >= 7_500 && (1...2).contains(zone) && !remote))
    }
}
