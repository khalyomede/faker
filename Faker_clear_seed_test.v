module test

import faker { Faker }

fn test_it_clears_the_seed() {
    seed := u32(36)
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(seed)
    fake2.using_seed(seed)

    assert fake1.word() == fake2.word()

    fake1.clear_seed()
    fake2.clear_seed()

    assert fake1.word() != fake2.word()
}
