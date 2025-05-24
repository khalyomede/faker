module test

import faker { Faker }

fn test_returns_random_element() {
    mut fake := Faker{}

    list := ['apple', 'banana', 'cherry']

    assert list.contains(fake.random_element(list))
}

fn test_it_picks_one_of_the_elements() {
    mut fake := Faker{}

    list := ['apple', 'banana', 'cherry']

    mut apple_was_picked_at_least_once := false
    mut banana_was_picked_at_least_once := false
    mut cherry_was_picked_at_least_once := false

    for _ in 0..100 {
        element := fake.random_element(list)

        if element == 'apple' {
            apple_was_picked_at_least_once = true
        } else if element == 'banana' {
            banana_was_picked_at_least_once = true
        } else if element == 'cherry' {
            cherry_was_picked_at_least_once = true
        }
    }

    assert apple_was_picked_at_least_once
    assert banana_was_picked_at_least_once
    assert cherry_was_picked_at_least_once
}

fn test_it_can_pick_the_same_value_when_both_instances_use_the_same_seed() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(12345)
    fake2.using_seed(12345)

    list := ['apple', 'banana', 'cherry']

    assert fake1.random_element(list) == fake2.random_element(list)
}
