module faker

pub fn (mut this Faker) boolean() bool {
    return match this.randomizer.u8() % 2 {
        0 { true }
        else { false }
    }
}
