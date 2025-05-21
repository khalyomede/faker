module test

import faker { Faker }

struct CustomFaker {
    Faker
}

type BetterFaker = Faker

fn (mut custom_faker CustomFaker) fruit() string {
    return custom_faker.random_element(["apple", "banana", "cherry"])
}

fn (mut better_faker BetterFaker) vegetable() string {
    return better_faker.random_element(["carrot", "broccoli", "spinach"])
}

fn test_it_allows_extending_faker_using_struct_inheritance() {
    mut fake := CustomFaker{}

    assert ["apple", "banana", "cherry"].contains(fake.fruit())
}

fn test_it_allows_extending_faker_using_type_alias() {
    mut fake := BetterFaker{}

    assert ["carrot", "broccoli", "spinach"].contains(fake.vegetable())
}
