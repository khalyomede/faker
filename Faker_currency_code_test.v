module test

import faker { Faker, Currency }

fn test_it_generates_currency_code() {
    mut fake := Faker{}

    code := fake.currency_code()
    codes := Currency.cases().map(it.to_code())

    assert codes.contains(code)
}
