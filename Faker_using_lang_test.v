module test

import faker { Faker, get_rows_in_file }

fn test_it_can_change_language_and_return_fake_data() {
    mut fake := Faker{}

    fake.using_lang(.en)

    assert get_rows_in_file(file: "sentence", lang: .en).contains(fake.sentence())
}
