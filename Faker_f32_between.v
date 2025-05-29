module faker

pub fn (mut this Faker) f32_between(parameters FakerF32BetweenParameters) f32 {
    if parameters.min > parameters.max {
        panic("min (${parameters.min}) cannot be greater than max (${parameters.max})")
    }

    if parameters.min == parameters.max {
        return parameters.min
    }

    range := parameters.max - parameters.min
    random_fraction := f32(this.randomizer.u32()) / f32(max_u32)

    return parameters.min + (random_fraction * range)
}
