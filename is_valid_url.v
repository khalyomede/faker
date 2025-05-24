module faker

pub fn is_valid_url(url string) bool {
    if url.len == 0 {
        return false
    }

    if !url.starts_with('http://') && !url.starts_with('https://') {
        return false
    }

    if url.contains(' ') {
        return false
    }

    if !url.contains('.') {
        return false
    }

    if url.count('.') < 1 {
        return false
    }

    if url.count('/') < 1 {
        return false
    }

    return true
}
