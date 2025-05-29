module test

import faker { Faker }

fn test_it_generates_u64() {
    mut fake := Faker{}

    number := fake.u64()

    assert number >= 0
    assert number < max_u64
}
