module faker

import os

fn (mut this Faker) get_file_path_for_language(name string, not_tied_to_lang bool) string {
    folder := match not_tied_to_lang {
        true { "shared" }
        false { this.lang.str() }
    }

    return os.dir(@FILE) + "/data/${folder}/${name}.txt"
}
