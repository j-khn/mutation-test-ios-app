public struct DeliveryEstimator: Sendable {
    public init() {}

    public func estimatedBusinessDays(zone: Int, orderedHour: Int, isRemoteArea: Bool) -> Int {
        let zoneDays = min(max(zone, 1), 4)
        let cutoffDelay = orderedHour >= 14 ? 1 : 0
        let remoteDelay = isRemoteArea ? 2 : 0
        return zoneDays + cutoffDelay + remoteDelay
    }

    public func isExpeditedEligible(subtotalCents: Int, zone: Int, isRemoteArea: Bool) -> Bool {
        subtotalCents >= 7_500 && (1...2).contains(zone) && !isRemoteArea
    }
}
