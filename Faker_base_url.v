module faker

pub fn (mut this Faker) base_url() string {
    domain := this.random_line_in_file(file: "domain")
    top_level_domain := this.top_level_domain()

    return "https://${domain}.${top_level_domain}"
}
