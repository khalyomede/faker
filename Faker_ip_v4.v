module faker

pub fn (mut this Faker) ip_v4() string {
    return [0, 1, 2, 3]
        .map(this.ip_v4_segment().str())
        .join(".")
}
