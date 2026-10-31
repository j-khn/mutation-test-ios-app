# CheckoutDomain

Checkout totals, receipts, receipt formatting, order state, and order policies.

- `Sources/CheckoutDomain`: 13 logic files, grouped by responsibility.
- `Tests/CheckoutDomainTests`: 13 test files, using Swift Testing.

Open `../../MutationTest.xcodeproj` and select the `MutationTest` scheme to run these tests together with all other feature and app tests on an iOS simulator.
The `MutationTestAppTests` Xcode target references these test sources directly; there are no duplicate test implementations.

For this package alone, run from the repository root:

```sh
swift test --package-path Modules/CheckoutDomain
```

New Swift files inside the existing source and test folders are picked up automatically.
