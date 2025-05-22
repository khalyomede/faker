module faker

import rand
import time { Time }

pub fn (this Faker) past_date() Time {
    random_epoch := rand.i64_in_range(0, time.now().unix()) or {
        panic(err)
    }

    return time.unix(random_epoch)
}
