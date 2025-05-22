module faker

import rand.pcg32 { PCG32RNG }

pub fn (mut this Faker) clear_seed() Faker {
    this.randomizer = PCG32RNG{}
    this.seeded = false

    return this
}
