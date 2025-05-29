module faker

pub fn (mut this Faker) i64() i64 {
    number := i64(this.randomizer.u64())

    return match this.boolean() {
        true { number }
        false { -number }
    }
}
