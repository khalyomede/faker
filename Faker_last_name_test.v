module test

import faker { Faker, get_rows_in_file }

fn test_returns_random_last_name() {
    mut fake := Faker{}

    assert get_rows_in_file("last-name", .en).contains(fake.last_name())
}
