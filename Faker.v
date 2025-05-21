module faker

import io { BufferedReader, BufferedReaderConfig }
import os { File }
import rand

pub struct Faker {
    pub:
        lang Lang = .en

    mut:
        files map[string]File
        lines_count map[string]u8
        picked_indexes map[string][]u8 // used to avoid duplicates
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
    mut opened_file := this.get_file(file) or { panic("Failed to open file \"${file_path}\".") }

    defer {
        opened_file.close()
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

fn (mut this Faker) random_index_in_file(file string, lines_count u8) u8 {
    random_index := u8_in_range(0, lines_count - 1) or {
        panic(err)
    }

    if this.picked_indexes[file].len == lines_count || !(file in this.picked_indexes) {
        this.picked_indexes[file] = [random_index]

        return random_index
    }

    if this.picked_indexes[file].contains(random_index) {
        return this.random_index_in_file(file, lines_count)
    }

    this.picked_indexes[file] << random_index

    return random_index
}

fn (mut this Faker) get_file(name string) !File {
    return this.files[name] or {
        opened_file := os.open(this.get_file_path_for_language(name))!

        this.files[name] = opened_file

        opened_file
    }
}

fn (mut this Faker) get_lines_count(name string, mut reader BufferedReader) u8 {
    if name in this.lines_count {
        return this.lines_count[name]
    }

    mut lines_count := u8(0)

    for {
        _ := reader.read_line() or { break }

        lines_count += 1
    }

    this.lines_count[name] = lines_count

    return lines_count
}

fn (mut this Faker) get_file_path_for_language(name string) string {
    return os.dir(@FILE) + "/data/${this.lang}/${name}.txt"
}

fn u8_in_range(min u8, max u8) !u8 {
    random_u32 := rand.u32_in_range(min, max)!

    return u8(random_u32)
}
