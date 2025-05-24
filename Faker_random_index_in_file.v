module faker

fn (mut this Faker) random_index_in_file(file string, lines_count u16) u16 {
    random_index := this.random_number(lines_count - 1)

    if this.seeded {
        return random_index
    }

    mut file_cache := unsafe {
        get_file_cache()
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
