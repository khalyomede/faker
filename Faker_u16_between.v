module faker

pub fn (mut this Faker) u16_between(parameters FakerU16BetweenParameters) u16 {
    if parameters.min > parameters.max {
        panic("min (${parameters.min}) cannot be greater than max (${parameters.max})")
    }

    range := parameters.max - parameters.min + 1
    random_offset := this.randomizer.u16() % range

    return parameters.min + random_offset
}

