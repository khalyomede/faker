module faker

pub fn (mut this Faker) i8() i8 {
    number := i8(this.randomizer.u8())

    return match this.boolean() {
        true { number }
        false { -number }
    }
}
