module test

import faker { Faker, get_rows_in_file }

fn test_returns_random_word() {
    mut fake := Faker{}

    assert get_rows_in_file(file: "word", lang: .en).contains(fake.word())
}
