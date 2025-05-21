module test

import faker { Faker }

fn test_returns_random_boolean() {
    mut fake := Faker{}

    assert [true, false].contains(fake.boolean())
}
