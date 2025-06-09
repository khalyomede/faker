module faker

pub fn is_valid_hex_color(color string) bool {
    if color.len != 7 {
        return false
    }

    if color[0] != `#` {
        return false
    }

    for i in 1..color.len {
        character := color[i]
        if !(
            (character >= `0` && character <= `9`) ||
            (character >= `a` && character <= `f`) ||
            (character >= `A` && character <= `F`)
        ) {
            return false
        }
    }

    return true
}
