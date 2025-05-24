module test

import faker { is_valid_mac_address }

fn test_it_validates_valid_mac_address() {
    assert is_valid_mac_address('01:23:45:67:89:AB')
}

fn test_it_doesnt_validate_invalid_mac_address() {
    assert !is_valid_mac_address('01:23:45:67:89:ZB')
}
