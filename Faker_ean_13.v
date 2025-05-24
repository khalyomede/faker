module faker

pub fn (mut this Faker) ean_13() string {
    mut digits := []string{len: 12}
    mut sum := 0

    for index in 0..12 {
        digit := (this.randomizer.u8() % 10)
        digits << digit.str()

        sum += match index % 2 == 0 {
            true { digit }
            false { digit * 3 }
        }
    }

    partial_code := digits.join('')

    check_digit := (10 - (sum % 10)) % 10

    return partial_code + check_digit.str()
}
