module test

import faker { Faker, get_rows_in_file }

fn test_returns_random_user_agent() {
    mut fake := Faker{}

    assert get_rows_in_file(file: "user-agent", not_tied_to_lang: true).contains(fake.user_agent())
}
