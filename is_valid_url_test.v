module test

import faker { is_valid_url }

fn test_it_validates_valid_url() {
    assert is_valid_url('https://example.com')
}

fn test_it_doesnt_validate_invalid_url() {
    assert !is_valid_url('invalid-url')
}

fn test_it_doesnt_validate_empty_url() {
    assert !is_valid_url('')
}

fn test_it_doesnt_validate_url_without_protocol() {
    assert !is_valid_url('example.com')
}

fn test_it_doesnt_validate_url_with_spaces() {
    assert !is_valid_url('https://example .com')
}

fn test_it_doesnt_validate_url_without_dot() {
    assert !is_valid_url('https://examplecom')
}
