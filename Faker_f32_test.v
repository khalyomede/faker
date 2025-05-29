module test

import faker { Faker }

fn test_it_generates_f32() {
    mut fake := Faker{}

    number := fake.f32()

    assert number >= min_i32
    assert number <= max_i32
}
