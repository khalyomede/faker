module faker

@[unsafe]
fn get_file_cache() &FileCache {
    mut static cache := &FileCache(nil)
    mut static initialized := false

    if !initialized {
        cache = &FileCache{}
        initialized = true
    }

    return cache
}
