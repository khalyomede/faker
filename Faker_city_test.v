module test

import faker { Faker, get_rows_in_file }

fn test_returns_random_city() {
    mut fake := Faker{}

    assert get_rows_in_file(file: "city", lang: .en).contains(fake.city())
}
