module test

import faker { is_valid_hex_color }

fn test_it_validates_valid_hex_color_uppercase() {
    assert is_valid_hex_color('#FF0000')
    assert is_valid_hex_color('#00FF00')
    assert is_valid_hex_color('#0000FF')
    assert is_valid_hex_color('#FFFFFF')
    assert is_valid_hex_color('#000000')
    assert is_valid_hex_color('#123ABC')
}

fn test_it_validates_valid_hex_color_lowercase() {
    assert is_valid_hex_color('#ff0000')
    assert is_valid_hex_color('#00ff00')
    assert is_valid_hex_color('#0000ff')
    assert is_valid_hex_color('#ffffff')
    assert is_valid_hex_color('#000000')
    assert is_valid_hex_color('#123abc')
}

fn test_it_validates_valid_hex_color_mixed_case() {
    assert is_valid_hex_color('#Ff0000')
    assert is_valid_hex_color('#00Ff00')
    assert is_valid_hex_color('#0000Ff')
    assert is_valid_hex_color('#AbCdEf')
}

fn test_it_doesnt_validate_hex_color_without_hash() {
    assert !is_valid_hex_color('FF0000')
    assert !is_valid_hex_color('123ABC')
}

fn test_it_doesnt_validate_hex_color_with_wrong_length() {
    assert !is_valid_hex_color('#FF00')
    assert !is_valid_hex_color('#FF00000')
    assert !is_valid_hex_color('#')
    assert !is_valid_hex_color('')
}

fn test_it_doesnt_validate_hex_color_with_invalid_characters() {
    assert !is_valid_hex_color('#GG0000')
    assert !is_valid_hex_color('#FF00ZZ')
    assert !is_valid_hex_color('#FF 000')
    assert !is_valid_hex_color('#FF-000')
    assert !is_valid_hex_color('#FF@000')
}

fn test_it_doesnt_validate_hex_color_starting_with_wrong_character() {
    assert !is_valid_hex_color('*FF0000')
    assert !is_valid_hex_color(' FF0000')
    assert !is_valid_hex_color('0xFF0000')
}
