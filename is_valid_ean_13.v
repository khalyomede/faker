module faker

pub fn is_valid_ean_13(code string) bool {
    if code.len != 13 {
        return false
    }

    for digit in code {
        if digit < `0` || digit > `9` {
            return false
        }
    }

    mut sum := 0

    for index in 0..12 {
        digit := u8(code[index] - `0`)

        sum += match index % 2 == 0 {
            true { digit }
            false { digit * 3 }
        }
    }

    remainder := sum % 10

    check_digit := match remainder == 0 {
        true { 0 }
        false { 10 - remainder }
    }

    actual_check_digit := u8(code[12] - `0`)

    return check_digit == actual_check_digit
}
