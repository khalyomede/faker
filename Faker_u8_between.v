module faker

pub fn (mut this Faker) u8_between(parameters FakerU8BetweenParameters) u8 {
    if parameters.min > parameters.max {
        panic("min (${parameters.min}) cannot be greater than max (${parameters.max})")
    }

    range := parameters.max - parameters.min + 1
    random_offset := this.randomizer.u8() % range

    return parameters.min + random_offset
}

