module faker

pub fn (mut this Faker) country_name() string {
    return this.random_element(Country.cases()).str()
}
