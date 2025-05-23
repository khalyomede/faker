module faker

pub fn is_valid_credit_card_number(number string) bool {
    return luhn(number[0..(number.len - 1)]) == number[number.len - 1].ascii_str().u8()
}
