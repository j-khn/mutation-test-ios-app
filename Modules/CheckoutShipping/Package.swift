// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CheckoutShipping",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [.library(name: "CheckoutShipping", targets: ["CheckoutShipping"])],
    targets: [
        .target(name: "CheckoutShipping"),
        .testTarget(name: "CheckoutShippingTests", dependencies: ["CheckoutShipping"])
    ]
)
