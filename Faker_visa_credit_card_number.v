module faker

pub fn (mut this Faker) visa_credit_card_number() string {
    first_digit := "4"
    remaining_digits := this.randomizer.u64() % 100000000000000
    digits := first_digit + remaining_digits.str()

    return digits + luhn(digits).str()
}
