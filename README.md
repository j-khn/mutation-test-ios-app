# MutationTest

A small Swift package demonstrating business logic, SwiftUI presentation, Swift Testing, and mutation testing.

## Structure

- `Sources/CheckoutDomain`: platform-independent checkout rules and receipt values.
- `Sources/CheckoutUI`: a SwiftUI view for presenting a calculated receipt.
- `Tests/CheckoutDomainTests`: boundary and business-rule tests using Swift Testing.
- `.swift-mutation-testing.yml`: mutation operators, scope, and report settings.
- `.github/workflows/ci.yml`: build/test, master-push mutation analysis, and release-build validation on a self-hosted macOS runner.

The Swift Testing suite contains about 3,000 independently executed parameterized test cases. Swift Testing's concise console summary groups these under the 27 test declarations; each argument value is executed as its own case. The cases cover promotion, tax, return/refund, delivery, inventory, loyalty, order-state, shipping, receipt formatting, and checkout calculations.

## Run locally

```sh
swift build
swift test
brew tap ericodx/homebrew-tools
brew install swift-mutation-testing
swift-mutation-testing .
```

The workflow uses the required runner labels `[self-hosted, macos]`. Register an Apple Silicon Mac runner with both labels (and Xcode/Swift plus Homebrew installed) before enabling Actions. The release-validation job intentionally stops at a successful release build until a deployment destination and credentials are chosen.
