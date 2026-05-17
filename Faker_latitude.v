module faker

pub fn (mut this Faker) latitude() f64 {
    integer_part := this.u8_between(min: 0, max: 90)
    decimal_part := this.u32_between(min: 0, max: 1000000)

    return f64(integer_part) + (f64(decimal_part) / 1000000.0)
}
