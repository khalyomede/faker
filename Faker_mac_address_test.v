module test

import faker { Faker, is_valid_mac_address }

fn test_returns_valid_mac_address() {
    mut fake := Faker{}

    mac_address := fake.mac_address()

    assert is_valid_mac_address(mac_address)
}

fn test_mac_address_is_in_uppercase() {
    mut fake := Faker{}

    mac_address := fake.mac_address()

    assert mac_address.to_upper() == mac_address
}

fn test_generates_different_mac_addresses() {
    mut fake := Faker{}

    first_mac_address := fake.mac_address()
    second_mac_address := fake.mac_address()

    assert first_mac_address != second_mac_address
}

fn test_it_can_generate_same_mac_address_with_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(42)
    fake2.using_seed(42)

    assert fake1.mac_address() == fake2.mac_address()
}

fn test_different_seeds_produce_different_mac_addresses() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(123)
    fake2.using_seed(456)

    assert fake1.mac_address() != fake2.mac_address()
}
