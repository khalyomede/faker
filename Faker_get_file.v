module faker

import os { File }

/*
  @todo Make the FileCache a map[string(lang or shared)][string]File instead of a single map[string]File.
*/
fn (mut this Faker) get_file(name string, not_tied_to_lang bool) !File {
    mut file_cache := unsafe {
        get_file_cache()
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
