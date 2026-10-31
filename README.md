# MutationTest

An iOS 17+ SwiftUI app with 300 business-logic files in local feature packages, Swift Testing tests, and mutation testing in GitHub Actions.

## Open and run

1. Open **MutationTest.xcodeproj** in Xcode 16 or later with a Swift 6 toolchain.
2. Select the **MutationTest** scheme and an installed iPhone simulator.
3. Press **Run** to open the checkout app.
4. Press **Command-U** to run every feature test and the app integration tests.

Physical devices require your own signing team in the app target's Signing & Capabilities settings.

## Project structure

- `App/Features/Checkout`: the SwiftUI screen and app state that combine the feature packages.
- `AppTests/Features/Checkout`: app tests that check receipt, shipping, stock, and loyalty behavior together.
- `Modules/CheckoutDomain`: receipts, totals, formatting, order state, and orders.
- `Modules/CheckoutPricing`: pricing, discounts, promotions, and tax.
- `Modules/CheckoutInventory`: inventory, procurement, and packaging.
- `Modules/CheckoutShipping`: shipping, delivery, and fulfillment.
- `Modules/CheckoutPayments`: payments, billing, invoices, finance, refunds, and returns.
- `Modules/CheckoutCustomer`: loyalty, membership, subscriptions, wallets, credit, and gift cards.
- `Modules/CheckoutMarketplace`: marketplace, vendor, and reconciliation rules.
- `Modules/CheckoutRisk`: risk, fraud, and compliance.
- `Modules/CheckoutUI`: shared SwiftUI receipt views.
- `Configuration`: shared, Debug, and Release build settings.

Each logic package has its own `Package.swift`, `Sources`, and `Tests` folders. Packages can be opened and tested separately, like the feature packages in a modular iOS app.

## Which tests run?

The app's **MutationTestAppTests** test target includes the test sources from all eight logic packages, plus `AppTests`. The shared `MutationTest` scheme and test plan select this full target.

The original 317 test declarations and their parameterized cases are preserved. The app adds four integration tests, for 321 declarations in total. Swift Testing reports parameterized cases under their test declaration.

Each generated logic file now has its own test file within its feature's test folder. For example:

- Logic: `Modules/CheckoutPricing/Sources/CheckoutPricing/Pricing/PricingRateLogic.swift`
- Tests: `Modules/CheckoutPricing/Tests/CheckoutPricingTests/Pricing/PricingRateLogicTests.swift`

## Run from the terminal

From the repository root:

```sh
# Choose an installed iPhone simulator automatically.
DESTINATION="$(python3 Scripts/select-simulator.py)"

# Build and run the complete iOS test target.
xcodebuild test \
  -project MutationTest.xcodeproj \
  -scheme MutationTest \
  -destination "$DESTINATION" \
  -derivedDataPath .build-xcode \
  -parallel-testing-enabled NO \
  CODE_SIGNING_ALLOWED=NO
```

To test one package without starting the app:

```sh
swift test --package-path Modules/CheckoutPricing
```

## Add files and packages

- Add logic inside a package's `Sources/<Module>` folder and tests inside its `Tests/<Module>Tests` folder. The package and Xcode synchronized folders pick them up automatically.
- Add app code inside `App` and app tests inside `AppTests`. Xcode picks these up automatically too.
- To add a new package, place it at `Modules/<Module>` with a library product named `<Module>`, then run `python3 Scripts/generate-project.py`. Commit the generated project and test plan. The script adds the package and its test sources to the app project.
- Packages should depend only on the specific packages they use. `CheckoutUI`, for example, depends on `CheckoutDomain`; the app combines the features.

## GitHub Actions

The existing job names are retained and now use the Xcode project:

- `test`: builds the iOS app and runs the full test target on an installed iPhone simulator.
- `mutation-testing`: runs `ericodx/swift-mutation-testing` in Xcode mode.
- `deploy`: validates the Release build. App Store upload is not configured.

Pushes to `master` mutate changed files under `App` and package `Sources` folders. The active mutation job keeps the full test target selected. Test files and package manifests are not mutated. The `mutest-swift` job is temporarily commented out while the Xcode setup is validated.

For a full mutation run, open Actions, choose **iOS CI**, then **Run workflow**, and set `mutation_scope` to `full`. Disable `mutation_cache` for a clean benchmark. `base_sha` overrides the comparison commit for changed-source analysis.

The runner needs the labels `[self-hosted, macos]`, full Xcode, Python 3, Homebrew, and an installed iPhone simulator running iOS 17 or later. The workflow checks Xcode and selects an available simulator automatically.

## Run mutation testing locally

The repository root is an Xcode project, with no root `Package.swift`. Feature packages remain inside `Modules`.

```sh
# Existing mutation tool: one source file, full app test target.
swift-mutation-testing . \
  --project MutationTest.xcodeproj \
  --scheme MutationTest \
  --target MutationTestAppTests \
  --destination "$(python3 Scripts/select-simulator.py)" \
  --sources-path Modules/CheckoutPricing/Sources/CheckoutPricing/Pricing/PricingRateLogic.swift \
  --xcodebuild-arg CODE_SIGNING_ALLOWED=NO
```

For `mutest-swift`, use these project and test settings with its executable:

```sh
swift-mutation-testing run \
  --project MutationTest.xcodeproj \
  --project-kind xcode-project \
  --scheme MutationTest \
  --test-target MutationTestAppTests \
  --destination "$(python3 Scripts/select-simulator.py)" \
  --source Modules/CheckoutPricing/Sources/CheckoutPricing/Pricing/PricingRateLogic.swift \
  --operator-tier experimental
```

The two tools currently use the same executable name; run the executable belonging to the tool you installed. Use the two separate workflow jobs to compare them without changing your terminal installation.
