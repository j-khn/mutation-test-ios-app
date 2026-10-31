import CheckoutShipping
import Testing

@Suite("Delivery estimator cases")
struct ExpandedShippingTests {
    @Test("checks delivery cutoff and expedited eligibility")
    func deliveryCases() {
        let estimator = DeliveryEstimator()
        #expect(estimator.estimatedBusinessDays(zone: 2, orderedHour: 14, isRemoteArea: false) == 3)
        #expect(estimator.isExpeditedEligible(subtotalCents: 7_500, zone: 2, isRemoteArea: false))
        #expect(!estimator.isExpeditedEligible(subtotalCents: 7_499, zone: 2, isRemoteArea: false))
    }
}
