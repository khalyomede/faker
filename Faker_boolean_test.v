module test

import faker { Faker }

fn test_returns_random_boolean() {
    mut fake := Faker{}

    mut false_was_picked_at_least_once := false
    mut true_was_picked_at_least_once := false

    // Since we generate a u8 (2^8 = 256), we iterate 256 times at most
    for _ in 0..255 {
        if fake.boolean() {
            true_was_picked_at_least_once = true
        } else {
            false_was_picked_at_least_once = true
        }
    }

    assert true_was_picked_at_least_once
    assert false_was_picked_at_least_once
}
