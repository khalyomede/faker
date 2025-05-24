module faker

pub fn (mut this Faker) word() string {
    return this.random_line_in_file(file: "word")
}
