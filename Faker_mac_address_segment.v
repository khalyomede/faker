module faker

fn (mut this Faker) mac_address_segment() string {
    segment := this.randomizer.u8()
    hex := segment.hex()

    return match hex.len {
        1 { '0${hex}' }
        else { hex }
    }.to_upper()
}
