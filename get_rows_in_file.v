module faker

import os

pub fn get_rows_in_file(file string, lang Lang) []string {
    file_path := os.join_path(os.dir(@FILE) + "/data/${lang}/${file}.txt")

    lines := os.read_lines(file_path) or {
        panic(err)
    }

    return lines
}
