module test

import faker { Faker, get_rows_in_file }

fn test_returns_random_company_name() {
    mut fake := Faker{}

    assert get_rows_in_file("company-name", .en).contains(fake.company_name())
}
