module faker

pub fn (mut this Faker) last_name() string {
    return this.random_line_in_file("last-name")
}
