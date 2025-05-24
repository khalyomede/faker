module test

import faker { Faker }

fn test_returns_valid_latitude() {
    mut fake := Faker{}

    latitude := fake.latitude()

    assert latitude >= -90.0 && latitude <= 90.0
}

fn test_generates_different_latitudes() {
    mut fake := Faker{}

    first_latitude := fake.latitude()
    second_latitude := fake.latitude()

    assert first_latitude != second_latitude
}

fn test_it_can_generate_same_latitude_with_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(42)
    fake2.using_seed(42)

    assert fake1.latitude() == fake2.latitude()
}

fn test_different_seeds_produce_different_latitudes() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(123)
    fake2.using_seed(456)

    assert fake1.latitude() != fake2.latitude()
}

fn test_generates_latitude_with_6_decimals() {
    mut fake := Faker{}

    assert fake.latitude().str().split('.')[1].len == 6
}
