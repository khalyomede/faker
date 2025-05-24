module test

import faker { Faker, Currency }

fn test_it_generates_currency_symbol() {
    mut fake := Faker{}

    symbol := fake.currency_symbol()
    symbols := Currency.cases().map(it.to_symbol())

    assert symbols.contains(symbol)
}
