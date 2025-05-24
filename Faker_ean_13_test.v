module test

import faker { Faker, is_valid_ean_13 }

fn test_it_generates_ean_13_code() {
    mut fake := Faker{}

    code := fake.ean_13()

    assert is_valid_ean_13(code)
}

fn test_it_generates_different_ean_13_on_subsequent_calls() {
    mut fake := Faker{}

    first_code := fake.ean_13()
    second_code := fake.ean_13()

    assert first_code != second_code
}

fn test_it_generates_same_ean_13_codes_on_different_fake_instance_using_same_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(36)
    fake2.using_seed(36)

    first_code := fake1.ean_13()
    second_code := fake2.ean_13()

    assert first_code == second_code
}

fn test_it_generates_same_ean_13_codes_on_different_fake_instance_using_different_seeds() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(111)
    fake2.using_seed(222)

    first_code := fake1.ean_13()
    second_code := fake2.ean_13()

    assert first_code != second_code
}
