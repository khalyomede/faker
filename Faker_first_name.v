module faker

pub fn (mut this Faker) first_name() string {
    return this.random_line_in_file("first-name")
}
