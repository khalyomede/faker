module faker

pub fn (mut this Faker) country_code(parameters FakerCountryCodeParameters) string {
    return match parameters.format {
        .alpha_2 { this.random_element(Country.cases()).to_alpha_2() }
        .alpha_3 { this.random_element(Country.cases()).to_alpha_3() }
    }
}
