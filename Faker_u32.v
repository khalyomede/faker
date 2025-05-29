module faker

pub fn (mut this Faker) u32() u32 {
    return this.randomizer.u32()
}
