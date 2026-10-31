import CheckoutPayments
import Testing

@Suite("Return policy cases")
struct ExpandedPaymentsTests {
    @Test("checks return eligibility and refund outcomes")
    func returnPolicyCases() {
        let policy = ReturnPolicy()
        #expect(policy.isReturnable(daysSincePurchase: 30, returnWindowDays: 30, isFinalSale: false, isUnused: true))
        #expect(!policy.isReturnable(daysSincePurchase: 31, returnWindowDays: 30, isFinalSale: false, isUnused: true))
        #expect(policy.refundCents(paidCents: 10_000, restockingFeeBasisPoints: 500, isDamaged: false) == 9_500)
        #expect(policy.exchangeAllowed(isReturnable: true, replacementInStock: true))
    }
}
