module test

import faker { Faker }

fn test_it_generates_u32() {
    mut fake := Faker{}

    number := fake.u32()

    assert number >= 0
    assert number <= max_u32
}
