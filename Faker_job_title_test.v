module test

import faker { Faker, get_rows_in_file }

fn test_it_generates_job_title() {
    mut fake := Faker{}

    assert get_rows_in_file(file: "job-title", lang: .en).contains(fake.job_title())
}

fn test_it_generates_different_job_titles_on_subsequent_calls() {
    mut fake := Faker{}

    assert fake.job_title() != fake.job_title()
}

fn test_it_generates_same_job_title_using_same_seed_on_different_fake_instances() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(100)
    fake2.using_seed(100)

    assert fake1.job_title() == fake2.job_title()
}

fn test_it_generates_different_job_titles_using_different_seed_on_different_fake_instance() {
    mut fake1 := Faker{}
    mut fake2 := Faker{}

    fake1.using_seed(100)
    fake2.using_seed(200)

    assert fake1.job_title() != fake2.job_title()
}
