module faker

fn (mut this Faker) random_number(max u16) u16 {
    return this.randomizer.u16() % (max + 1)
}
