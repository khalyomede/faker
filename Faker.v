module faker

import io { BufferedReader }
import os { File }
import rand.pcg32 { PCG32RNG }

pub struct Faker {
    pub mut:
        lang Lang = .en
        randomizer PCG32RNG
        seeded bool
}

@[unsafe]
fn get_cache() &FileCache {
    mut static cache := &FileCache(nil)
    mut static initialized := false

    if !initialized {
        cache = &FileCache{}
        initialized = true
    }

    return cache
}

fn (mut this Faker) random_index_in_file(file string, lines_count u16) u16 {
    random_index := this.random_number(lines_count - 1)

    if this.seeded {
        return random_index
    }

    mut file_cache := unsafe {
        get_cache()
    }

    file_cache.mutex.rlock()

    it_should_reset_picked_indexes := file_cache.picked_indexes[file].len == lines_count || !(file in file_cache.picked_indexes)

    file_cache.mutex.runlock()

    if  it_should_reset_picked_indexes {
        file_cache.mutex.lock()

        file_cache.picked_indexes[file] = [random_index]

        file_cache.mutex.unlock()

        return random_index
    }

    file_cache.mutex.rlock()

    it_should_generate_new_index := file_cache.picked_indexes[file].contains(random_index)

    file_cache.mutex.runlock()

    if it_should_generate_new_index {
        return this.random_index_in_file(file, lines_count)
    }

    file_cache.mutex.lock()

    file_cache.picked_indexes[file] << random_index

    file_cache.mutex.unlock()

    return random_index
}

/*
  @todo Make the FileCache a map[string(lang or shared)][string]File instead of a single map[string]File.
*/
fn (mut this Faker) get_file(name string, not_tied_to_lang bool) !File {
    mut file_cache := unsafe {
        get_cache()
    }

    file_cache.mutex.rlock()

    file_in_cache := name in file_cache.files

    file_cache.mutex.runlock()

    if  file_in_cache {
        file_cache.mutex.rlock()
        opened_file := file_cache.files[name] or {
            file_cache.mutex.runlock()

            panic("Key ${name} not found in file cache.")
        }

        file_cache.mutex.runlock()

        return opened_file
    }

    opened_file := os.open(this.get_file_path_for_language(name, not_tied_to_lang))!

    file_cache.mutex.lock()

    file_cache.files[name] = opened_file

    file_cache.mutex.unlock()

    return opened_file
}

fn (mut this Faker) get_lines_count(name string, mut reader BufferedReader) u16 {
    mut file_cache := unsafe {
        get_cache()
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

fn (mut this Faker) get_file_path_for_language(name string, not_tied_to_lang bool) string {
    folder := match not_tied_to_lang {
        true { "shared" }
        false { this.lang.str() }
    }

    return os.dir(@FILE) + "/data/${folder}/${name}.txt"
}
