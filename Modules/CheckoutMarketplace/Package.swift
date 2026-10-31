// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CheckoutMarketplace",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [.library(name: "CheckoutMarketplace", targets: ["CheckoutMarketplace"])],
    targets: [
        .target(name: "CheckoutMarketplace"),
        .testTarget(name: "CheckoutMarketplaceTests", dependencies: ["CheckoutMarketplace"])
    ]
)
