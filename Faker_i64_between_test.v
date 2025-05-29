module test

import faker { Faker }

fn test_it_generates_i64_within_range() {
    mut fake := Faker{}

    number := fake.i64_between(min: min_i64 + 1, max: -4)

    assert number >= min_i64 + 1
    assert number <= -4
}

fn test_it_generates_i64_of_same_value_when_min_equals_max() {
    mut fake := Faker{}

    number := fake.i64_between(min: -42, max: -42)

    assert number == -42
}

fn test_it_generates_different_i64_values_on_subsequent_calls() {
    mut fake := Faker{}

    first := fake.i64_between(min: -100, max: 100)
    second := fake.i64_between(min: -100, max: 100)

    assert first != second
}

fn test_it_generates_same_i64_values_with_same_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(123)
    fake2.using_seed(123)

    first := fake1.i64_between(min: -50, max: 50)
    second := fake2.i64_between(min: -50, max: 50)

    assert first == second
}

fn test_it_generates_different_i64_values_with_different_seeds() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(111)
    fake2.using_seed(222)

    first := fake1.i64_between(min: -10, max: 10)
    second := fake2.i64_between(min: -10, max: 10)

    assert first != second
}

fn test_it_works_with_positive_range() {
    mut fake := Faker{}

    number := fake.i64_between(min: 10, max: 20)

    assert number >= 10
    assert number <= 20
}

fn test_it_works_with_mixed_range() {
    mut fake := Faker{}

    number := fake.i64_between(min: -5, max: max_i64 - 1)

    assert number >= -5
    assert number <= max_i64 - 1
}
