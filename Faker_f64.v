module faker

pub fn (mut this Faker) f64() f64 {
    number := this.i64()
    fraction := (this.u32() + this.u16() + this.u8()) / 1_000_000_000_000_000
    is_negative := number < 0

    return match is_negative {
        true { number + fraction }
        false { number - fraction }
    }
}
