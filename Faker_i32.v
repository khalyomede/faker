module faker

pub fn (mut this Faker) i32() i32 {
    number := i32(this.randomizer.u32())

    return match this.boolean() {
        true { number }
        false { -number }
    }
}
