module test

import faker { Faker }

fn test_it_generates_i32() {
    mut fake := Faker{}

    number := fake.i32()

    assert number >= min_i32
    assert number <= max_i32
}
