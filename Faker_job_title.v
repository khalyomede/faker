module faker

pub fn (mut this Faker) job_title() string {
    return this.random_line_in_file(file: "job-title")
}
