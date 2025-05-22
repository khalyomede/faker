module faker

pub fn (this Faker) boolean() bool {
    return this.random_element([true, false])
}
