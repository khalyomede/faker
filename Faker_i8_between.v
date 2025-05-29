module faker

pub fn (mut this Faker) i8_between(parameters FakerI8BetweenParameters) i8 {
    if parameters.min > parameters.max {
        panic("min (${parameters.min}) cannot be greater than max (${parameters.max})")
    }

    range := u8(parameters.max - parameters.min + 1)
    random_offset := this.randomizer.u8() % range

    return parameters.min + i8(random_offset)
}
