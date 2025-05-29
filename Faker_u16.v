module faker

pub fn (mut this Faker) u16() u16 {
    return this.randomizer.u16()
}
