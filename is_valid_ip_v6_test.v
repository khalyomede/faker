module test

import faker { is_valid_ip_v6 }

fn test_it_validates_valid_ip_v6() {
    assert is_valid_ip_v6('2001:0db8:85a3:0000:0000:8a2e:0370:7334')
}

fn test_it_validates_valid_ip_v6_with_uppercase() {
    assert is_valid_ip_v6('2001:0DB8:85A3:0000:0000:8A2E:0370:7334')
}

fn test_it_doesnt_validate_invalid_ip_v6_too_few_segments() {
    assert !is_valid_ip_v6('2001:0db8:85a3:0000:0000:8a2e:0370')
}

fn test_it_doesnt_validate_invalid_ip_v6_too_many_segments() {
    assert !is_valid_ip_v6('2001:0db8:85a3:0000:0000:8a2e:0370:7334:extra')
}

fn test_it_doesnt_validate_invalid_ip_v6_wrong_segment_length() {
    assert !is_valid_ip_v6('2001:0db8:85a3:000:0000:8a2e:0370:7334')
}

fn test_it_doesnt_validate_invalid_ip_v6_invalid_characters() {
    assert !is_valid_ip_v6('2001:0db8:85a3:000g:0000:8a2e:0370:7334')
}

fn test_it_doesnt_validate_empty_ip_v6() {
    assert !is_valid_ip_v6('')
}

fn test_it_doesnt_validate_ip_v6_with_spaces() {
    assert !is_valid_ip_v6('2001:0db8:85a3:0000:0000:8a2e:0370:733 4')
}
