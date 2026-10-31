import CheckoutPayments
import Testing

@Suite("CheckoutPayments boundary cases")
struct ExpandedPaymentsTests {
    @Test("enforces return-window boundaries", arguments: Array(0...350))
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
}
