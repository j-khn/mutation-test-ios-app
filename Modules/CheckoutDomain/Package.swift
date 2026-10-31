// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CheckoutDomain",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [.library(name: "CheckoutDomain", targets: ["CheckoutDomain"])],
    targets: [
        .target(name: "CheckoutDomain"),
        .testTarget(name: "CheckoutDomainTests", dependencies: ["CheckoutDomain"])
    ]
)
