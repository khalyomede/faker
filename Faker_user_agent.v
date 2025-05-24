module faker

pub fn (mut this Faker) user_agent() string {
    return this.random_line_in_file(file: "user-agent", not_tied_to_lang: true)
}
