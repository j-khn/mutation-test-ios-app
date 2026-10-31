import CheckoutDomain
import Testing

@Suite("Order status transitions")
struct OrderStatusTests {
    @Test("allows only valid forward and cancellation transitions")
    func transitionRules() {
        #expect(OrderStatus.placed.canTransition(to: .paid))
        #expect(OrderStatus.placed.canTransition(to: .cancelled))
        #expect(!OrderStatus.placed.canTransition(to: .shipped))
        #expect(OrderStatus.paid.canTransition(to: .shipped))
        #expect(OrderStatus.shipped.canTransition(to: .delivered))
        #expect(!OrderStatus.delivered.canTransition(to: .cancelled))
        #expect(!OrderStatus.cancelled.canTransition(to: .placed))
    }
}
