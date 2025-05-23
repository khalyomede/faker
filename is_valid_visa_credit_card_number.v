module faker

pub fn is_valid_visa_credit_card_number(number string) bool {
    if number.len != 16 {
        return false
    }

    if number[0] != `4` {
        return false
    }

    if !is_valid_credit_card_number(number) {
        return false
    }

    return true
}
