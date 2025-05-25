module faker

pub fn (mut this Faker) email() string {
    return this.random_line_in_file(file: "email")
}
