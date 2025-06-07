module faker

pub fn (mut this Faker) zip_code() string {
    return this.u16_between(min: 10000, max: 99999).str()
}
