module faker

pub fn is_valid_mac_address(address string) bool {
    segments := address.split(':')

    if segments.len != 6 {
        return false
    }

    for segment in segments {
        if segment.len != 2 {
            return false
        }

        for character in segment {
            if !(
                (character >= `0` && character <= `9`) ||
                (character >= `a` && character <= `f`) ||
                (character >= `A` && character <= `F`)
            ) {
                return false
            }
        }
    }

    return true
}
