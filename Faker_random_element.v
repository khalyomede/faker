module faker

pub fn (mut this Faker) random_element[T](elements []T) T {
    number_of_elements := u64(elements.len)
    random_index := this.randomizer.u64() % number_of_elements

    return elements[random_index] or {
        panic("Failed to get random element at index ${random_index} with length ${number_of_elements}.")
    }
}
