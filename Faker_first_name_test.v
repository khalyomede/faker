module test

import faker { Faker, get_rows_in_file }

fn test_returns_random_first_name() {
    mut fake := Faker{}

    assert get_rows_in_file(file: "first-name", lang: .en).contains(fake.first_name())
}
