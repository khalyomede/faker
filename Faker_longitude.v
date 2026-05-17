module faker

pub fn (mut this Faker) longitude() f64 {
    integer_part := this.i16_between(min: -180, max: 180)
    decimal_part := this.u32_between(min: 0, max: 1000000)

    return f64(integer_part) + (f64(decimal_part) / 1000000.0)
}
