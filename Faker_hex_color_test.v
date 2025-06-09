module test

import faker { Faker, is_valid_hex_color }

fn test_returns_valid_hex_color() {
    mut fake := Faker{}

    hex_color := fake.hex_color()

    assert is_valid_hex_color(hex_color)
}

fn test_hex_color_starts_with_hash() {
    mut fake := Faker{}

    hex_color := fake.hex_color()

    assert hex_color[0] == `#`
}

fn test_hex_color_is_7_characters_long() {
    mut fake := Faker{}

    hex_color := fake.hex_color()

    assert hex_color.len == 7
}

fn test_generates_different_hex_colors() {
    mut fake := Faker{}

    first_color := fake.hex_color()
    second_color := fake.hex_color()

    assert first_color != second_color
}

fn test_it_can_generate_same_hex_color_with_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(42)
    fake2.using_seed(42)

    assert fake1.hex_color() == fake2.hex_color()
}

fn test_different_seeds_produce_different_hex_colors() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(123)
    fake2.using_seed(456)

    assert fake1.hex_color() != fake2.hex_color()
}

fn test_hex_color_uses_uppercase_letters() {
    mut fake := Faker{}

    mut found_letter := false
    for _ in 0..100 {
        hex_color := fake.hex_color()
        for i in 1..hex_color.len {
            character := hex_color[i]
            if character >= `A` && character <= `F` {
                found_letter = true
                break
            }

            assert !(character >= `a` && character <= `f`)
        }
        if found_letter {
            break
        }
    }
}
