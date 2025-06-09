module faker

pub fn (mut this Faker) hex_color() string {
    red := this.randomizer.u8()
    green := this.randomizer.u8()
    blue := this.randomizer.u8()

    red_hex := red.hex().to_upper()
    green_hex := green.hex().to_upper()
    blue_hex := blue.hex().to_upper()

    red_formatted := match red_hex.len {
        1 { '0${red_hex}' }
        else { red_hex }
    }

    green_formatted := match green_hex.len {
        1 { '0${green_hex}' }
        else { green_hex }
    }

    blue_formatted := match blue_hex.len {
        1 { '0${blue_hex}' }
        else { blue_hex }
    }

    return '#${red_formatted}${green_formatted}${blue_formatted}'
}
