module faker

pub fn is_valid_ip_v6(ip string) bool {
    segments := ip.split(':')

    if segments.len != 8 {
        return false
    }

    for segment in segments {
        if segment.len != 4 {
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
