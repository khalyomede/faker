module test

import faker { Faker, get_rows_in_file }

fn test_returns_sentence() {
    mut fake := Faker{}

    assert get_rows_in_file(file: "sentence", lang: .en).contains(fake.sentence())
}
