module faker

pub fn (mut this Faker) street() string {
    return this.u8_between(min: 1, max: 255).str() + " " + this.street_name()
}
