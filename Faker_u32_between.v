module faker

pub fn (mut this Faker) u32_between(parameters FakerU32BetweenParameters) u32 {
    if parameters.min > parameters.max {
        panic("min (${parameters.min}) cannot be greater than max (${parameters.max})")
    }

    range := parameters.max - parameters.min + 1
    random_offset := this.randomizer.u32() % range

    return parameters.min + random_offset
}

