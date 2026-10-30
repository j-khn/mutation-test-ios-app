import CheckoutDomain
import Testing

@Suite("Receipt formatting")
struct ReceiptFormatterTests {
    let formatter = ReceiptFormatter()

    @Test("formats cents as localized currency")
    func currencyFormatting() {
        #expect(formatter.format(cents: 1_250) == "$12.50")
        #expect(formatter.format(cents: 0) == "$0.00")
    }

    @Test("uses the requested currency and locale")
    func customCurrencyAndLocale() {
        #expect(formatter.format(cents: 1_250, currencyCode: "EUR", locale: Locale(identifier: "de_DE")) == "12,50 €")
    }
}
