module test

import faker { Faker }

fn test_it_generates_u64_within_range() {
    mut fake := Faker{}

    number := fake.u64_between(min: 10, max: 20)

    assert number >= 10
    assert number <= 20
}

fn test_it_generates_u64_of_same_value_when_min_equals_max() {
    mut fake := Faker{}

    number := fake.u64_between(min: 42, max: 42)

    assert number == 42
}

fn test_it_generates_two_different_u64_values_on_subsequent_calls() {
    mut fake := Faker{}

    first := fake.u64_between(min: 1, max: max_u64 - 1)
    second := fake.u64_between(min: 1, max: max_u64 - 1)

    assert first != second
}

fn test_it_generates_same_u64_values_with_same_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(123)
    fake2.using_seed(123)

    first := fake1.u64_between(min: 50, max: 100)
    second := fake2.u64_between(min: 50, max: 100)

    assert first == second
}

fn test_it_generates_different_u64_values_with_different_seeds() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(111)
    fake2.using_seed(222)

    first := fake1.u64_between(min: 10, max: 50)
    second := fake2.u64_between(min: 10, max: 50)

    assert first != second
}
