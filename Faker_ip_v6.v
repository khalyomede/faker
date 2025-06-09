module faker

pub fn (mut this Faker) ip_v6() string {
    return [0, 1, 2, 3, 4, 5, 6, 7]
        .map(this.ip_v6_segment())
        .join(":")
}
