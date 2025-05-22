module faker

import io { BufferedReader, BufferedReaderConfig }
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

/*
    This function will read a file and return a random line from it.

    It does so by first counting the number of lines in the file.
    Then it generates a random number between 0 and the number of lines - 1.

    It then reads the file again, line by line, until it reaches the random number.
    At which point it returns that line.

    This is done to avoid loading the entire file into memory, which can be expensive for large files.
*/
fn (mut this Faker) random_line_in_file(file string) string {
    file_path := this.get_file_path_for_language(file)

    mut index := 0
    mut opened_file := unsafe {
        this.get_file(file) or { panic("Failed to open file \"${file_path}\".") }
    }

    mut reader := io.new_buffered_reader(BufferedReaderConfig{
        reader: opened_file
    })

    defer {
        reader.free()
    }

    lines_count := this.get_lines_count(file, mut reader)

    random_index := this.random_index_in_file(file, lines_count)

    opened_file.seek(0, .start) or {
        panic("Failed to seek to the start of the file \"${file_path}\".")
    }

    mut lines_reader := io.new_buffered_reader(BufferedReaderConfig{
        reader: opened_file
    })

    defer {
        lines_reader.free()
    }

    for {
        line := lines_reader.read_line() or { break }

        if index == random_index {
            return line
        }

        index += 1
    }

    panic("No line found in file \"${file_path}\".")

    return ""
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

fn (mut this Faker) get_file(name string) !File {
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

    opened_file := os.open(this.get_file_path_for_language(name))!

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

fn (mut this Faker) get_file_path_for_language(name string) string {
    return os.dir(@FILE) + "/data/${this.lang}/${name}.txt"
}

