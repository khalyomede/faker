module faker

pub fn (mut this Faker) company_name() string {
    return this.random_line_in_file(file: "company-name")
}
