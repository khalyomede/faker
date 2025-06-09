module test

import faker { Faker, is_valid_ip_v6 }

fn test_returns_valid_ip_v6() {
    mut fake := Faker{}

    ip_v6 := fake.ip_v6()

    assert is_valid_ip_v6(ip_v6)
}

fn test_generates_different_ip_v6_addresses() {
    mut fake := Faker{}

    first := fake.ip_v6()
    second := fake.ip_v6()

    assert first != second
}

fn test_it_can_generate_same_ip_v6_with_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(42)
    fake2.using_seed(42)

    assert fake1.ip_v6() == fake2.ip_v6()
}

fn test_different_seeds_produce_different_ip_v6_addresses() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(123)
    fake2.using_seed(456)

    assert fake1.ip_v6() != fake2.ip_v6()
}

fn test_ip_v6_has_correct_format() {
    mut fake := Faker{}

    ip_v6 := fake.ip_v6()
    segments := ip_v6.split(':')

    assert segments.len == 8

    for segment in segments {
        assert segment.len == 4
    }
}

fn test_ip_v6_uses_lowercase_hex() {
    mut fake := Faker{}

    ip_v6 := fake.ip_v6()

    assert ip_v6 == ip_v6.to_lower()
}
