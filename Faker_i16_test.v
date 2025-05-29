module test

import faker { Faker }

fn test_it_generates_i16() {
    mut fake := Faker{}

    number := fake.i16()

    assert number >= min_i16
    assert number <= max_i16
}
