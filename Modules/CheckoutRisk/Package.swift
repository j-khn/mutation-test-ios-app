// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "CheckoutRisk",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [.library(name: "CheckoutRisk", targets: ["CheckoutRisk"])],
    targets: [
        .target(name: "CheckoutRisk"),
        .testTarget(name: "CheckoutRiskTests", dependencies: ["CheckoutRisk"])
    ]
)
