module test

import faker { luhn }

fn test_it_generates_valid_luhn_key() {
    assert luhn('799273987') == 3
}

