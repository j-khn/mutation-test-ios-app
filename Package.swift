// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "MutationTest",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "CheckoutDomain", targets: ["CheckoutDomain"]),
        .library(name: "CheckoutUI", targets: ["CheckoutUI"])
    ],
    targets: [
        .target(name: "CheckoutDomain"),
        .target(name: "CheckoutUI", dependencies: ["CheckoutDomain"]),
        .testTarget(name: "CheckoutDomainTests", dependencies: ["CheckoutDomain"])
    ]
)
