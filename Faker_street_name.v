module faker

pub fn (mut this Faker) street_name() string {
    return this.random_line_in_file(file: "street-name")
}
