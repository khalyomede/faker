module test

import faker { Faker, TopLevelDomain }

fn test_it_generates_top_level_domain() {
    mut fake := Faker{}

    assert fake.top_level_domain() in TopLevelDomain.cases().map(it.str())
}
