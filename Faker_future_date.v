module faker

import rand
import time { Time }

pub fn (mut this Faker) future_date() Time {
    random_epoch := rand.i64_in_range(time.now().unix(), max_i64) or {
        panic(err)
    }

    return time.unix(random_epoch)
}
