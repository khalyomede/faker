module test

import faker { is_valid_ean_13 }

fn test_it_validates_valid_ean_13() {
    assert is_valid_ean_13('1234567890128')
}

fn test_it_doesnt_validate_invalid_ean_13() {
    assert !is_valid_ean_13('1234567890127')
}

fn test_it_doesnt_validate_invalid_ean_13_length() {
    assert !is_valid_ean_13('12345')
}

fn test_it_doesnt_validate_empty_ean_13() {
    assert !is_valid_ean_13('')
}

fn test_it_doesnt_validate_non_numeric_ean_13() {
    assert !is_valid_ean_13('123456789012A')
}
