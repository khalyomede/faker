module test

import faker { Faker }

fn test_it_generates_u8() {
    mut fake := Faker{}

    number := fake.u8()

    assert number >= 0
    assert number <= max_u8
}
