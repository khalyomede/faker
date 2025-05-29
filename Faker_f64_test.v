module test

import faker { Faker }

fn test_it_generates_f64() {
    mut fake := Faker{}

    number := fake.f64()

    assert number >= min_i64
    assert number <= max_i64
}
