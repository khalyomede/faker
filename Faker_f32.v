module faker

pub fn (mut this Faker) f32() f32 {
    number := f32(this.i16())
    fraction := f32(this.u16() + this.u8()) / 1_000_000
    is_negative := number < 0

    return match is_negative {
        true { number + fraction }
        false { number - fraction }
    }
}
