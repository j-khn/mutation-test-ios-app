// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CheckoutCustomer",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [.library(name: "CheckoutCustomer", targets: ["CheckoutCustomer"])],
    targets: [
        .target(name: "CheckoutCustomer"),
        .testTarget(name: "CheckoutCustomerTests", dependencies: ["CheckoutCustomer"])
    ]
)
