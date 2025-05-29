module faker

pub fn (mut this Faker) u64_between(parameters FakerU64BetweenParameters) u64 {
    if parameters.min > parameters.max {
        panic("min (${parameters.min}) cannot be greater than max (${parameters.max})")
    }

    range := parameters.max - parameters.min + 1
    random_offset := this.randomizer.u64() % range

    return parameters.min + random_offset
}

