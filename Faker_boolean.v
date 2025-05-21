module faker

pub fn (mut this Faker) boolean() bool {
    return this.random_element([true, false])
}
