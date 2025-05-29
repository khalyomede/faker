module faker

pub fn (mut this Faker) u64() u64 {
    return this.randomizer.u64()
}
