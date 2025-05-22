module test

import faker { Faker }

fn test_returns_random_boolean() {
    fake := Faker{}

    assert [true, false].contains(fake.boolean())
}
