module faker

pub fn (mut this Faker) f64_between(parameters FakerF64BetweenParameters) f64 {
    if parameters.min > parameters.max {
        panic("min (${parameters.min}) cannot be greater than max (${parameters.max})")
    }

    if parameters.min == parameters.max {
        return parameters.min
    }

    range := parameters.max - parameters.min
    random_fraction := f64(this.randomizer.u64()) / f64(max_u64)

    return parameters.min + (random_fraction * range)
}
