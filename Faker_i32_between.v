module faker

pub fn (mut this Faker) i32_between(parameters FakerI32BetweenParameters) i32 {
    if parameters.min > parameters.max {
        panic("min (${parameters.min}) cannot be greater than max (${parameters.max})")
    }

    range := u32(parameters.max - parameters.min + 1)
    random_offset := this.randomizer.u32() % range

    return parameters.min + i32(random_offset)
}
