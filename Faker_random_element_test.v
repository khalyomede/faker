module test

import faker { Faker }

fn test_returns_random_element() {
    fake := Faker{}

    list := ['apple', 'banana', 'cherry']

    assert list.contains(fake.random_element(list))
}
