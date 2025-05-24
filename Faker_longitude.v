module faker

pub fn (mut this Faker) longitude() f64 {
    integer_part := int(this.randomizer.u16() % 361) - 180
    decimal_part := this.randomizer.u32() % 1000000

    return f64(integer_part) + (f64(decimal_part) / 1000000.0)
}
