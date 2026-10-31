# CheckoutPayments

Payments, billing, invoices, finance, refunds, and return policies.

- `Sources/CheckoutPayments`: 61 logic files, grouped by responsibility.
- `Tests/CheckoutPaymentsTests`: 61 test files, using Swift Testing.

Open `../../MutationTest.xcodeproj` and select the `MutationTest` scheme to run these tests together with all other feature and app tests on an iOS simulator.
The `MutationTestAppTests` Xcode target references these test sources directly; there are no duplicate test implementations.

For this package alone, run from the repository root:

```sh
swift test --package-path Modules/CheckoutPayments
```

New Swift files inside the existing source and test folders are picked up automatically.
