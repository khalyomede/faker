module faker

pub fn (mut this Faker) latitude() f64 {
    integer_part := int(this.randomizer.u8() % 181) - 90
    decimal_part := this.randomizer.u32() % 1000000

    return f64(integer_part) + (f64(decimal_part) / 1000000.0)
}
