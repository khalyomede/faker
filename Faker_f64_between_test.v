module test

import faker { Faker }

fn test_it_generates_f64_within_range() {
    mut fake := Faker{}

    number := fake.f64_between(min: 10.5, max: 20.7)

    assert number >= 10.5
    assert number <= 20.7
}

fn test_it_generates_f64_of_same_value_when_min_equals_max() {
    mut fake := Faker{}

    number := fake.f64_between(min: 42.123456789, max: 42.123456789)

    assert number == 42.123456789
}

fn test_it_generates_different_f64_values_on_subsequent_calls() {
    mut fake := Faker{}

    first := fake.f64_between(min: -100.5, max: 100.5)
    second := fake.f64_between(min: -100.5, max: 100.5)

    assert first != second
}

fn test_it_generates_same_f64_values_with_same_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(123)
    fake2.using_seed(123)

    first := fake1.f64_between(min: -50.25, max: 50.75)
    second := fake2.f64_between(min: -50.25, max: 50.75)

    assert first == second
}

fn test_it_generates_different_f64_values_with_different_seeds() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(111)
    fake2.using_seed(222)

    first := fake1.f64_between(min: -10.1, max: 10.9)
    second := fake2.f64_between(min: -10.1, max: 10.9)

    assert first != second
}

fn test_it_works_with_positive_range() {
    mut fake := Faker{}

    number := fake.f64_between(min: 1.5, max: 2.5)

    assert number >= 1.5
    assert number <= 2.5
}

fn test_it_works_with_negative_range() {
    mut fake := Faker{}

    number := fake.f64_between(min: -20.7, max: -10.3)

    assert number >= -20.7
    assert number <= -10.3
}

fn test_it_works_with_mixed_range() {
    mut fake := Faker{}

    number := fake.f64_between(min: -5.5, max: 5.5)

    assert number >= -5.5
    assert number <= 5.5
}

fn test_it_works_with_very_small_range() {
    mut fake := Faker{}

    number := fake.f64_between(min: 1.000000001, max: 1.000000002)

    assert number >= 1.000000001
    assert number <= 1.000000002
}

fn test_it_works_with_zero_boundaries() {
    mut fake := Faker{}

    number := fake.f64_between(min: 0.0, max: 1.0)

    assert number >= 0.0
    assert number <= 1.0
}

fn test_it_works_with_large_numbers() {
    mut fake := Faker{}

    number := fake.f64_between(min: 1_000_000.0, max: 2_000_000.0)

    assert number >= 1_000_000.0
    assert number <= 2_000_000.0
}

fn test_it_works_with_scientific_notation() {
    mut fake := Faker{}

    number := fake.f64_between(min: 1e-10, max: 1e-9)

    assert number >= 1e-10
    assert number <= 1e-9
}
