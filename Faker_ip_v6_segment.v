module faker

fn (mut this Faker) ip_v6_segment() string {
    segment := this.randomizer.u16()
    hex := segment.hex()

    // Pad with zeros to ensure 4 characters
    return match hex.len {
        1 { '000${hex}' }
        2 { '00${hex}' }
        3 { '0${hex}' }
        else { hex }
    }
}
