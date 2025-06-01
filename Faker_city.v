module faker

pub fn (mut this Faker) city() string {
    return this.random_line_in_file(file: "city")
}
