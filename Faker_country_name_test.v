module test

import faker { Faker, Country }

fn test_it_generates_country_name() {
    mut fake := Faker{}

    name := fake.country_name()
    names := Country.cases().map(it.str())

    assert names.contains(name)
}
