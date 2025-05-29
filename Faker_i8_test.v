module test

import faker { Faker }

fn test_it_generates_i8() {
    mut fake := Faker{}

    number := fake.i8()

    assert number >= min_i8
    assert number <= max_i8
}
