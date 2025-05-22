module faker

import rand.pcg32 { PCG32RNG }

pub fn (mut this Faker) using_seed(seed u32) Faker {
    this.randomizer.seed([seed, seed >> 16, seed + 1, (seed + 1) >> 16])
    this.seeded = true

    return this
}
