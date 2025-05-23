module faker

pub fn luhn(digits string) u8 {
    mut sum := 0
    mut is_even := true

    for i := digits.len - 1; i >= 0; i-- {
        mut digit := u8(digits[i])

        if is_even {
            digit *= 2

            if digit > 9 {
                digit -= 9
            }
        }

        sum += digit
        is_even = !is_even
    }

    return u8((10 - (sum % 10)) % 10)
}
