module faker

import io { BufferedReaderConfig }

/*
    This function will read a file and return a random line from it.

    It does so by first counting the number of lines in the file.
    Then it generates a random number between 0 and the number of lines - 1.

    It then reads the file again, line by line, until it reaches the random number.
    At which point it returns that line.

    This is done to avoid loading the entire file into memory, which can be expensive for large files.
*/
fn (mut this Faker) random_line_in_file(parameters RandomLineInFileParameters) string {
    file_path := this.get_file_path_for_language(parameters.file, parameters.not_tied_to_lang)

    mut index := 0
    mut opened_file := unsafe {
        this.get_file(parameters.file, parameters.not_tied_to_lang) or { panic("Failed to open file \"${file_path}\".") }
    }

    mut reader := io.new_buffered_reader(BufferedReaderConfig{
        reader: opened_file
    })

    defer {
        reader.free()
    }

    lines_count := this.get_lines_count(parameters.file, mut reader)

    random_index := this.random_index_in_file(parameters.file, lines_count)

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
