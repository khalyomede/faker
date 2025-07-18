module faker

pub fn (mut this Faker) i64_between(parameters FakerI64BetweenParameters) i64 {
    if parameters.min > parameters.max {
        panic("min (${parameters.min}) cannot be greater than max (${parameters.max})")
    }

    range := u64(parameters.max - parameters.min + 1)
    random_offset := this.randomizer.u64() % range

    return parameters.min + i64(random_offset)
}
