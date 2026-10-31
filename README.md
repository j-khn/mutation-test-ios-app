# MutationTest

A small iOS 17+ SwiftUI checkout app for comparing mutation-testing tools. It has **5 production Swift files** and **50 Swift Testing cases** across four local Swift packages and the app target.

## Open and run

1. Open `MutationTest.xcodeproj` in Xcode with a Swift 6 toolchain.
2. Select the `MutationTest` scheme and an installed iPhone simulator.
3. Press **Run** to open the checkout app.
4. Press **Command-U** to run the app and package tests.

## Project structure

- `App/MutationTestApp.swift`: app entry point, checkout screen, receipt view, and view model.
- `AppTests/Features/Checkout`: app-level checkout scenarios.
- `Modules/CheckoutDomain`: receipt calculation and currency formatting.
- `Modules/CheckoutCustomer`: loyalty points and redemption.
- `Modules/CheckoutInventory`: fulfillment and remaining-stock rules.
- `Modules/CheckoutShipping`: shipping fees and weight thresholds.
- `Configuration`: shared, Debug, and Release build settings.

Each feature package has a `Package.swift`, one production source file, and a Swift Testing test target. The Xcode test target runs all four package test files plus the app scenario tests.

## Run from the terminal

From the repository root, choose an installed simulator and run the full iOS test target:

```sh
DESTINATION="$(python3 Scripts/select-simulator.py)"
xcodebuild test \
  -project MutationTest.xcodeproj \
  -scheme MutationTest \
  -destination "$DESTINATION" \
  -derivedDataPath .build-xcode \
  -parallel-testing-enabled NO \
  CODE_SIGNING_ALLOWED=NO
```

To run a single package's tests without starting the app:

```sh
swift test --package-path Modules/CheckoutDomain
```

## GitHub Actions

The `iOS CI` workflow runs on pushes and pull requests targeting `master`, and on manual dispatch:

- `test`: builds the iOS app and runs all 50 tests on an iPhone simulator.
- `mutation-testing`: runs `ericodx/swift-mutation-testing` on changed source files and the full test target.
- `mutation-testing-using-mutest-swift`: runs `mutest-swift` on the same changed sources and full test target.
- `deploy`: validates the Release build; App Store upload is not configured.

For a full mutation run, open Actions, choose **iOS CI**, then **Run workflow**, and set `mutation_scope` to `full`. Turn off `mutation_cache` for a clean benchmark. The runner needs the labels `[self-hosted, macos]`, Xcode, Python 3, Homebrew, and an available iPhone simulator.

## Run mutation testing locally

The repository root is an Xcode project, with local feature packages under `Modules`.

```sh
DESTINATION="$(python3 Scripts/select-simulator.py)"

# ericodx/swift-mutation-testing: mutate one source file; run the full test target.
swift-mutation-testing . \
  --project MutationTest.xcodeproj \
  --scheme MutationTest \
  --target MutationTestAppTests \
  --destination "$DESTINATION" \
  --sources-path Modules/CheckoutDomain/Sources/CheckoutDomain/CheckoutCalculator.swift

# mutest-swift: same project, source, and full test target.
mutest-swift run \
  --project MutationTest.xcodeproj \
  --project-kind xcode-project \
  --scheme MutationTest \
  --test-target MutationTestAppTests \
  --destination "$DESTINATION" \
  --source Modules/CheckoutDomain/Sources/CheckoutDomain/CheckoutCalculator.swift \
  --operator-tier experimental
```

The tools may use the same executable name when installed from different sources. Use the executable for the tool you want to run.
