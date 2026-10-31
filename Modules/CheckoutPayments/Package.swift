// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CheckoutPayments",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [.library(name: "CheckoutPayments", targets: ["CheckoutPayments"])],
    targets: [
        .target(name: "CheckoutPayments"),
        .testTarget(name: "CheckoutPaymentsTests", dependencies: ["CheckoutPayments"])
    ]
)
