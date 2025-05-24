module faker

pub fn (mut this Faker) currency_symbol() string {
    return this.random_element(Currency.cases()).to_symbol()
}
