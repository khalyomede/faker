module test

import faker { Faker, get_rows_in_file }

fn test_returns_random_street() {
    mut fake := Faker{}

    assert get_rows_in_file(file: "street", lang: .en).contains(fake.street())
}

fn test_generates_different_streets_on_subsequent_calls() {
    mut fake := Faker{}

    assert fake.street() != fake.street()
}

fn test_generates_same_street_using_same_seed_across_different_fake_instances() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(100)
    fake2.using_seed(100)

    assert fake1.street() == fake2.street()
}

fn test_generates_different_street_using_different_seed_across_different_fake_instances() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(100)
    fake2.using_seed(200)

    assert fake1.street() != fake2.street()
}
