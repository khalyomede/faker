module test

import faker { Faker, get_rows_in_file }

fn test_returns_random_street_name() {
    mut fake := Faker{}

    assert get_rows_in_file(file: "street-name", lang: .en).contains(fake.street_name())
}

fn test_generates_different_street_names_on_subsequent_calls() {
    mut fake := Faker{}

    assert fake.street_name() != fake.street_name()
}

fn test_generates_same_street_name_using_same_seed_across_different_fake_instances() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(100)
    fake2.using_seed(100)

    assert fake1.street_name() == fake2.street_name()
}

fn test_generates_different_street_names_using_different_seed_across_different_fake_instances() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(100)
    fake2.using_seed(200)

    assert fake1.street_name() != fake2.street_name()
}
