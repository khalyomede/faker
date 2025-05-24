module faker

pub fn (mut this Faker) mac_address() string {
    return [0, 1, 2, 3, 4, 5]
        .map(this.mac_address_segment())
        .join(":")
}
