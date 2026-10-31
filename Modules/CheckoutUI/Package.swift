// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CheckoutUI",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [.library(name: "CheckoutUI", targets: ["CheckoutUI"])],
    dependencies: [.package(path: "../CheckoutDomain")],
    targets: [.target(name: "CheckoutUI", dependencies: [.product(name: "CheckoutDomain", package: "CheckoutDomain")])]
)
