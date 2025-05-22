module test

import faker { Faker, get_rows_in_file }

fn test_it_can_generate_same_values_for_same_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(36)
    fake2.using_seed(36)

    first_fake1_word := fake1.word()
    first_fake2_word := fake2.word()

    assert first_fake1_word == first_fake2_word

    second_fake1_word := fake1.word()
    second_fake2_word := fake2.word()

    assert second_fake1_word == second_fake2_word

    assert first_fake1_word != second_fake1_word
    assert first_fake2_word != second_fake2_word
}
