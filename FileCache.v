module faker

import os { File }
import sync { RwMutex, new_rwmutex }

/*
    This module is used to cache files and their lines count.
    It is used to avoid reading the same file multiple times.

    It is shared across all instances of the Faker struct to
    optimize the cache hit.
*/
struct FileCache {
    pub mut:
        files map[string]File
        lines_count map[string]u16
        picked_indexes map[string][]u16 // used to avoid duplicates
        mutex &RwMutex = new_rwmutex()
}
