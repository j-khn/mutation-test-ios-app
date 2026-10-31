public enum OrderStatus: String, Hashable, Sendable {
    case placed
    case paid
    case shipped
    case delivered
    case cancelled

    public var canTransitionTo: Set<OrderStatus> {
        switch self {
        case .placed: [.paid, .cancelled]
        case .paid: [.shipped, .cancelled]
        case .shipped: [.delivered]
        case .delivered, .cancelled: []
        }
    }

    public func canTransition(to next: OrderStatus) -> Bool {
        canTransitionTo.contains(next)
    }
}
