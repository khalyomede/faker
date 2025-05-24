module faker

pub fn (mut this Faker) sentence() string {
    return this.random_line_in_file(file: "sentence")
}
