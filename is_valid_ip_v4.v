module faker

pub fn is_valid_ip_v4(ip string) bool {
    segments := ip.split('.')

    if segments.len != 4 {
        return false
    }

    for segment in segments {
        num := segment.int()

        if num < 0 || num > 255 {
            return false
        }
    }

    return true
}
