module faker

fn (mut this Faker) ip_v4_segment() u8 {
    return u8(this.randomizer.u8() % 256)
}
