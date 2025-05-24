module faker

import io { BufferedReader }

fn (mut this Faker) get_lines_count(name string, mut reader BufferedReader) u16 {
    mut file_cache := unsafe {
        get_file_cache()
    }

    file_cache.mutex.rlock()

    file_in_cache := name in file_cache.lines_count

    file_cache.mutex.runlock()

    if file_in_cache {
        file_cache.mutex.rlock()

        lines_count := file_cache.lines_count[name] or {
            file_cache.mutex.runlock()

            panic("Key ${name} not found in lines count cache.")
        }

        file_cache.mutex.runlock()

        return lines_count
    }

    mut lines_count := u16(0)

    for {
        _ := reader.read_line() or { break }

        lines_count += 1
    }


    file_cache.mutex.lock()

    file_cache.lines_count[name] = lines_count

    file_cache.mutex.unlock()

    return lines_count
}
