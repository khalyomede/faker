module test

import faker { Faker, is_valid_uuid_v4 }

fn test_returns_uuid_v4() {
    fake := Faker{}

    assert is_valid_uuid_v4(uuid: fake.uuid_v4())
}
