module test

import faker { Faker }

fn test_it_generates_i64() {
    mut fake := Faker{}

    number := fake.i64()

    assert number >= min_i64
    assert number <= max_i64
}
