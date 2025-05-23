module test

import faker { Faker, get_rows_in_file, is_valid_ip_v4 }

fn test_returns_valid_ip_v4() {
    mut fake := Faker{}

    ip_v4 := fake.ip_v4()

    assert is_valid_ip_v4(ip_v4)
}
