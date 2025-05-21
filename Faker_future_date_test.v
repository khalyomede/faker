module test

import faker { Faker, get_rows_in_file }
import time

fn test_returns_future_date() {
    mut fake := Faker{}

    assert time.now() <= fake.future_date()
}
