module faker

import rand

pub fn (this Faker) uuid_v4() string {
    return rand.uuid_v4()
}
