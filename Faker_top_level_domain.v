module faker

pub fn (mut this Faker) top_level_domain() string {
    return this.random_element(TopLevelDomain.cases()).str()
}
