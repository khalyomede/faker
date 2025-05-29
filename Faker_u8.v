module faker

pub fn (mut this Faker) u8() u8 {
    return this.randomizer.u8()
}
