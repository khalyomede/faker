module test

import faker { Faker }

fn test_returns_valid_longitude() {
    mut fake := Faker{}

    longitude := fake.longitude()

    assert longitude >= -180.0 && longitude <= 180.0
}

fn test_generates_different_longitudes() {
    mut fake := Faker{}

    first := fake.longitude()
    second := fake.longitude()

    assert first != second
}

fn test_it_can_generate_same_longitude_with_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(42)
    fake2.using_seed(42)

    assert fake1.longitude() == fake2.longitude()
}
