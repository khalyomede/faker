module faker

pub fn (mut this Faker) street() string {
    return this.random_line_in_file(file: "street")
}
