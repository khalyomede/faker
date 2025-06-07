module test

import faker { Faker }

fn test_it_generates_five_digits_code() {
    mut fake := Faker{}

    zip_code := fake.zip_code()

    assert zip_code.len == 5
    assert zip_code.int() >= 10000
    assert zip_code.int() <= 99999
}

fn test_it_generates_different_zip_codes_on_subsequent_calls() {
    mut fake := Faker{}

    assert fake.zip_code() != fake.zip_code()
}

fn test_it_can_generate_same_zip_code_using_same_seed_across_different_fake_instances() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(100)
    fake2.using_seed(100)

    assert fake1.zip_code() == fake2.zip_code()
}

fn test_it_generate_different_zip_code_using_different_seeds_across_different_fake_instances() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(100)
    fake2.using_seed(200)

    assert fake1.zip_code() != fake2.zip_code()
}
