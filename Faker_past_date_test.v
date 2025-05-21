module test

import faker { Faker, get_rows_in_file }
import time

fn test_returns_past_date() {
    mut fake := Faker{}

    assert time.now() >= fake.past_date()
}
