module test

import faker { Faker }

fn test_it_generates_different_street_names() {
    mut fake := Faker{}

    assert fake.street() != fake.street()
}

fn test_it_generates_same_street_using_same_seed_on_different_fake_instances() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(100)
    fake2.using_seed(100)

    assert fake1.street() == fake2.street()
}

fn test_it_generates_different_streets_using_same_seed_on_different_fake_instance() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(200)
    fake2.using_seed(100)

    assert fake1.street() != fake2.street()
}
