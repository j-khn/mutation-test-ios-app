import CheckoutShipping
import Testing

@Suite("CheckoutShipping boundary cases")
struct ExpandedShippingTests {
    @Test("estimates delivery across zones, cutoff times, and remote addresses", arguments: [
        0, 13, 14, 350
    ])
    func deliveryEstimates(index: Int) {
        let zone = index % 6
        let hour = index % 24
        let remote = index.isMultiple(of: 2)
        let days = DeliveryEstimator().estimatedBusinessDays(zone: zone, orderedHour: hour, isRemoteArea: remote)
        #expect((1...7).contains(days))
        #expect(days == min(max(zone, 1), 4) + (hour >= 14 ? 1 : 0) + (remote ? 2 : 0))
    }

    @Test("applies expedited delivery eligibility rules", arguments: [
        299, 300, 301
    ])
    func expeditedEligibility(index: Int) {
        let zone = index % 5
        let spend = index * 25
        let remote = index.isMultiple(of: 3)
        #expect(DeliveryEstimator().isExpeditedEligible(subtotalCents: spend, zone: zone, isRemoteArea: remote) == (spend >= 7_500 && (1...2).contains(zone) && !remote))
    }
}
