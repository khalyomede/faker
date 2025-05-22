module faker

pub fn (mut this Faker) using_lang(lang Lang) Faker {
    this.lang = lang

    return this
}
