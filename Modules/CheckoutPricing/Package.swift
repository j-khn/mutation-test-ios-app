// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CheckoutPricing",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [.library(name: "CheckoutPricing", targets: ["CheckoutPricing"])],
    targets: [
        .target(name: "CheckoutPricing"),
        .testTarget(name: "CheckoutPricingTests", dependencies: ["CheckoutPricing"])
    ]
)
