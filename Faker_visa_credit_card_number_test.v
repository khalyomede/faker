module test

import faker { Faker, is_valid_credit_card_number }

fn test_returns_visa_credit_card_number() {
    mut fake := Faker{}

    credit_card_number := fake.visa_credit_card_number()

    assert is_valid_credit_card_number(credit_card_number)
}
