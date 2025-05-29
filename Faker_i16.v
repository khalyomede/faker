module faker

pub fn (mut this Faker) i16() i16 {
    number := i16(this.randomizer.u16())

    return match this.boolean() {
        true { number }
        false { -number }
    }
}
