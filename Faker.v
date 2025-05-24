module faker

import rand.pcg32 { PCG32RNG }

pub struct Faker {
    pub mut:
        lang Lang = .en
        randomizer PCG32RNG
        seeded bool
}
