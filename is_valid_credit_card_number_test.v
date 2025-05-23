module test

import faker { is_valid_credit_card_number }

fn test_it_validates_valid_visa_credit_card_number() {
    assert is_valid_credit_card_number('4508393419758105')
}

fn test_it_doesnt_validate_invalid_visa_credit_card_number() {
    assert !is_valid_credit_card_number('4508393419758103')
}

fn test_it_doesnt_validate_invalid_visa_credit_card_number_length() {
    assert !is_valid_credit_card_number('45083934197581056')
}
