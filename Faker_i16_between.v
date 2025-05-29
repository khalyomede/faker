module faker

pub fn (mut this Faker) i16_between(parameters FakerI16BetweenParameters) i16 {
    if parameters.min > parameters.max {
        panic("min (${parameters.min}) cannot be greater than max (${parameters.max})")
    }

    range := u16(parameters.max - parameters.min + 1)
    random_offset := this.randomizer.u16() % range

    return parameters.min + i16(random_offset)
}
