module test

import faker { Faker, get_rows_in_file }

fn test_returns_random_email() {
    mut fake := Faker{}

    assert get_rows_in_file(file: "email", lang: .en).contains(fake.email())
}
