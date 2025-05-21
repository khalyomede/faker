module faker

import rand

pub fn (this Faker) random_element[T](elements []T) T {
    number_of_elements := elements.len
    random_index := rand.int_in_range(0, number_of_elements - 1) or {
        panic("Failed to generate random index.")
    }

    return elements[random_index] or {
        panic("Failed to get random element at index ${random_index} with length ${number_of_elements}.")
    }
}
