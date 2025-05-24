module faker

import os

pub fn get_rows_in_file(parameters GetRowsInFileParameters) []string {
    folder := match parameters.not_tied_to_lang {
        true { "shared" }
        false { parameters.lang.str() }
    }

    file_path := os.join_path(os.dir(@FILE) + "/data/${folder}/${parameters.file}.txt")

    lines := os.read_lines(file_path) or {
        panic(err)
    }

    return lines
}
