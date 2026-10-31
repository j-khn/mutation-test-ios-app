// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CheckoutInventory",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [.library(name: "CheckoutInventory", targets: ["CheckoutInventory"])],
    targets: [
        .target(name: "CheckoutInventory"),
        .testTarget(name: "CheckoutInventoryTests", dependencies: ["CheckoutInventory"])
    ]
)
