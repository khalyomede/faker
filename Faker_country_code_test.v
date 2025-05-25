module test

import faker { Faker, Country }

fn test_it_generates_alpha_2_country_code() {
    mut fake := Faker{}

    code := fake.country_code(format: .alpha_2)
    codes := Country.cases().map(it.to_alpha_2())

    assert codes.contains(code)
}

fn test_it_generates_alpha_3_country_code() {
    mut fake := Faker{}

    code := fake.country_code(format: .alpha_3)
    codes := Country.cases().map(it.to_alpha_3())

    assert codes.contains(code)
}
