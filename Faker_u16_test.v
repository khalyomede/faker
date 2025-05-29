module test

import faker { Faker }

fn test_it_generates_u16() {
    mut fake := Faker{}

    number := fake.u16()

    assert number >= 0
    assert number <= max_u16
}
