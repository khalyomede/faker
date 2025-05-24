module test

import faker { Faker, is_valid_url }

fn test_it_generates_base_url() {
    mut fake := Faker{}

    base_url := fake.base_url()

    assert is_valid_url(base_url)
}
