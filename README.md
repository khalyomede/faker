# Faker

Generate fake values for your tests.

## Summary

- [About](#about)
- [Features](#features)
- [Disclaimer](#disclaimer)
- [Installation](#installation)
- [Examples](#examples)
- [Q&A](#qa)

## About

I created this package to avoid having to hard code testing values, like UUIDs, words, first names, ... When testing my features.

## Features

- Provide various functions to get semi-real values
- Supports the following languages:
  - English
- Consumes the least virtual memory possible
- Ensures maximum uniqueness by keeping track of already picked values

## Disclaimer

Please do not use this library in production or when compiling V to a single binary.

This library uses heavy .txt files as source of data, and they are not embeded in the final compiled binary (primarily because they would make your executable much more heavy).

Plus, for simplicity, the package immediately calls `panic()` for each error encountered, which is unsuitable for production.

Use this library solely within your "*_test.v" file.

## Installation

- [Using V installer](#using-v-installer)
- [Manual installation](#manual-installation)

### Using V installer

In your root folder, open a terminal and run this command:

```bash
v install khalyomede.faker
```

### Manual installation

- Locate your V modules folder (usually in "/$USER/.vmodules", so if you're using the root user, "/root/.vmodules")
- Create a folder named "khalyomede"
- Inside "khalyomed" folder, create a folder named "faker"
- Copy the entire content of this repositor in the "$USER/.vmodules/khalyomede/faker" repository

## Examples

- Fake data
  - Company
    - [Company name](#company-name)
  - Date
    - [Future date](#future-date)
    - [Past date](#past-date)
  - Finance
    - [Currency code](#currency-code)
    - [Currency symbol](#currency-symbol)
    - [Visa credit card number](#visa-credit-card-number)
  - Geographic
    - [Country code](#country-code)
    - [Country name](#country-name)
    - [Latitude](#latitude)
    - [Longitude](#longitude)
  - Identifiers
    - [EAN-13](#ean-13)
    - [UUID v4](#uuid-v4)
  - Math
    - [Boolean](#boolean)
    - Floating numbers
      - [f32](#f32)
      - [f64](#f64)
      - [f32 between](#f32-between)
      - [f64 between](#f64-between)
    - Integers
      - [i8](#i8)
      - [i16](#i16)
      - [i32](#i32)
      - [i64](#i64)
      - [i8 between](#i8-between)
      - [i16 between](#i16-between)
      - [i32 between](#i32-between)
      - [i64 between](#i64-between)
    - Unsigned integers
      - [u8](#u8)
      - [u16](#u16)
      - [u32](#u32)
      - [u64](#u64)
      - [u8 between](#u8-between)
      - [u16 between](#u16-between)
      - [u32 between](#u32-between)
      - [u64 between](#u64-between)
  - Network
    - [IP V4](#ip-v4)
    - [MAC address](#mac-address)
  - Physical persons
    - [First name](#first-name)
    - [Last name](#last-name)
  - Text
    - [Sentence](#sentence)
    - [Word](#word)
  - Utilities
    - [Random element](#random-element)
  - Web
    - [Base URL](#base-url)
    - [Email](#email)
    - [User agent](#user-agent)
    - [Top level domain](#top-level-domain)
- [Switching language](#switching-language)
- [Extending/Custom fake data](#extendingcustom-fake-data)
- [Deterministic same values (seed)](#deterministic-same-values-seed)

### Base URL

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_base_url() {
  mut fake := Faker{}

  base_url := fake.base_url()
}
```

[Back to examples](#examples)

### Boolean

```v
module test

import khalyomede.faker { Faker }

fn test_it_returns_a_value() {
  mut fake := Faker{}

  terms_of_use_accepted := fake.boolean()

  // ...
}
```

[Back to examples](#examples)

### Company name

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_company_name() {
  mut fake := Faker{}

  company := fake.company_name()

  // ...
}
```

[Back to examples](#examples)

### Country code

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_country_codes() {
  mut fake := Faker{}

  code2 := fake.country_code(format: .alpha_2)
  code3 := fake.country_code(format: .alpha_3)

  // ...
}
```

### Country name

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_country_name() {
  mut fake := Faker{}

  name := fake.country_name()

  // ...
}
```

[Back to examples](#examples)

### Currency code

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_currency_code() {
  mut fake := Faker{}

  code := fake.currency_code()

  // ...
}
```

[Back to examples](#examples)

### Currency symbol

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_currency_symbol() {
  mut fake := Faker{}

  symbol := fake.currency_symbol()

  // ...
}
```

[Back to examples](#examples)

### EAN-13

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_ean_13() {
  mut fake := Faker{}

  code := fake.ean_13()

  // ...
}
```

[Back to examples](#examples)

### Email

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_email() {
  mut fake := Faker{}

  email := fake.email()

  // ...
}
```

[Back to examples](#examples)

### f32

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_f32() {
  mut fake := Faker{}

  number := fake.f32()

  // ...
}
```

[Back to examples](#examples)

### f32 between

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_f32_between_range() {
  mut fake := Faker{}

  number := fake.f32_between(min: -35.546, max: 106.71)

  // ...
}
```

[Back to examples](#examples)

### f64

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_f64() {
  mut fake := Faker{}

  number := fake.f64()

  // ...
}
```

[Back to examples](#examples)

### f64 between

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_f64_between_range() {
  mut fake := Faker{}

  number := fake.f64_between(min: -35_000.546, max: 106_000.71)

  // ...
}
```

[Back to examples](#examples)

### First name

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_first_name() {
  mut fake := Faker{}

  first_name := fake.first_name()

  // ...
}
```

[Back to examples](#examples)

### Future date

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_future_date() {
  fake := Faker{}

  meeting_date := fake.future_date()

  // ...
}
```

[Back to examples](#examples)

### i16

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_i16() {
  fake := Faker{}

  number := fake.i16()

  // ...
}
```

[Back to examples](#examples)

### i16 between

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_i16_between_range() {
  fake := Faker{}

  number := fake.i16_between(min: -121, max: 595)

  // ...
}
```

[Back to examples](#examples)

### i32

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_i32() {
  fake := Faker{}

  number := fake.i32()

  // ...
}
```

[Back to examples](#examples)

### i32 between

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_i32_between_range() {
  fake := Faker{}

  number := fake.i32_between(min: -1_229, max: 5_941)

  // ...
}
```

[Back to examples](#examples)

### i64

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_i64() {
  fake := Faker{}

  number := fake.i64()

  // ...
}
```

[Back to examples](#examples)

### i64 between

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_i64_between_range() {
  fake := Faker{}

  number := fake.i64_between(min: -12_500, max: 59_000)

  // ...
}
```

[Back to examples](#examples)

### i8

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_i8() {
  fake := Faker{}

  number := fake.i8()

  // ...
}
```

[Back to examples](#examples)

### i8 between

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_i8_between_range() {
  fake := Faker{}

  number := fake.i8_between(min: -12, max: 59)

  // ...
}
```

[Back to examples](#examples)

### IP V4

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_ip_v4() {
  mut fake := Faker{}

  ip := fake.ip_v4()

  // ...
}
```

[Back to examples](#examples)

### Last name

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_last_name() {
  mut fake := Faker{}

  last_name := fake.last_name()

  // ...
}
```

[Back to examples](#examples)

### Latitude

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_latitude() {
  mut fake := Faker{}

  latitude := fake.latitude()

  // ...
}
```

[Back to examples](#examples)

### Longitude

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_longitude() {
  mut fake := Faker{}

  longitude := fake.longitude()

  // ...
}
```

[Back to examples](#examples)

### MAC address

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_mac_address() {
  mut fake := Faker{}

  mac_address := fake.mac_address()

  // ...
}
```

[Back to examples](#examples)

### Past date

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_past_date() {
  fake := Faker{}

  payment_date := fake.past_date()
}
```

[Back to examples](#examples)

### Random element

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_random_fruit() {
  mut fake := Faker{}

  fruits := ["banana", "kiwi", "apple"]

  fruit := fake.random_element(fruits)

  // ...
}
```

[Back to examples](#examples)

### Sentence

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_sentence() {
  mut fake := Faker{}

  book_excerpt := fake.sentence()
}
```

[Back to examples](#examples)

### Top level domain

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_top_level_domain() {
  mut fake := Faker{}

  top_level_domain := fake.top_level_domain()

  // ...
}
```

[Back to examples](#examples)

### u16

```v
module test

import faker { Faker }

fn test_it_generates_u16() {
  mut fake := Faker{}

  number := fake.u16()

  // ...
}
```

[Back to examples](#examples)

### u16 between

```v
module test

import faker { Faker }

fn test_it_generates_u16_between_two_numbers() {
  mut fake := Faker{}

  number := fake.u16_between(min: 1, max: 65_535)

  // ...
}
```

[Back to examples](#examples)

### u32

```v
module test

import faker { Faker }

fn test_it_generates_u32() {
  mut fake := Faker{}

  number := fake.u32()

  // ...
}
```

[Back to examples](#examples)

### u32 between

```v
module test

import faker { Faker }

fn test_it_generates_u32_between_two_numbers() {
  mut fake := Faker{}

  number := fake.u32_between(min: 12_500, max: 55_000)

  // ...
}
```

[Back to examples](#examples)

### u64

```v
module test

import faker { Faker }

fn test_it_generates_u64() {
  mut fake := Faker{}

  number := fake.u64()

  // ...
}
```

[Back to examples](#examples)

### u64 between

```v
module test

import faker { Faker }

fn test_it_generates_u64_between_two_numbers() {
  mut fake := Faker{}

  number := fake.u64_between(min: 1, max: 1_000_000)

  // ...
}
```

[Back to examples](#examples)

### u8

```v
module test

import faker { Faker }

fn test_it_generates_u8() {
  mut fake := Faker{}

  number := fake.u8()

  // ...
}
```

[Back to examples](#examples)

### u8 between

```v
module test

import faker { Faker }

fn test_it_generates_u8_between_two_numbers() {
  mut fake := Faker{}

  number := fake.u8_between(min: 12, max: 50)

  // ...
}
```

[Back to examples](#examples)

### User agent

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_user_agent() {
  mut fake := Faker{}

  user_agent := fake.user_agent()

  // ...
}
```

[Back to examples](#examples)

### UUID v4

```v
module test

import khalyomede.faker { Faker }

fn test_it_returns_url() {
  fake := Faker{}

  payment_id := fake.uuid_v4()

  // ...
}
```

[Back to examples](#examples)

### Visa credit card number

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_visa_credit_card_number() {
  mut fake := Faker{}

  credit_card := fake.visa_credit_card_number()

  // ...
}
```

[Back to examples](#examples)

### Word

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_word() {
  mut fake := Faker{}

  book_category := fake.word()

  // ...
}
```

[Back to examples](#examples)

### Switching language

- [From instanciation](#from-instanciation)
- [In between tests](#in-between-tests)

#### From instanciation

```v
module test

import khalyomede.faker { Faker }

fn test_it_switches_language() {
  mut fake := Faker{lang: .en}

  // ...
}
```

#### In between tests

```v
module test

import khalyomede.faker { Faker }

fn test_it_switches_language_after_generating_data() {
  mut fake := Faker{lang: .en}

  book_excerpt := fake.sentence()

  fake.using_lang(.en)

  // ...
}
```

[Back to examples](#examples)

## Extending/Custom fake data

- [Using struct inheritance](#using-struct-inheritance)
- [Using a type alias](#using-a-type-alias)

### Using struct inheritance

```v
module test

import khalyomede.faker { Faker }

struct CustomFaker {
  Faker
}

fn (mut custom_faker CustomFaker) fruit() string {
  return custom_faker.random_element(["banana", "orange", "apple"])
}

fn test_it_generates_fruit() {
  mut fake := CustomFaker{}

  fruit := fake.fruit()

  // ...
}
```

### Using a type alias

```v
module test

import khalyomede.faker { Faker }

type CustomFaker = Faker

fn (custom_faker CustomFaker) fruit() string {
  return custom_faker.random_element(["banana", "orange", "apple"])
}

fn test_it_generates_fruit() {
  mut fake := CustomFaker{}

  fruit := fake.fruit()
}
```

[Back to examples](#examples)

### Deterministic same values (seed)

- [Same random values across different tests](#same-random-values-across-different-tests)
- [Clearing the seed afterward](#clearing-the-seed-afterward)

#### Same random values across different tests

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_the_same_word_as_second_test() {
  mut fake := Faker{}

  fake.using_seed(36)

  word := fake.word() // same as second test word
}

fn test_it_generates_the_same_word_as_first_test() {
  mut fake := Faker{}

  fake.using_seed(36)

  word := fake.word() // same as first test word
}
```

#### Clearing the seed afterward

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_the_same_word_as_second_test() {
  mut fake := Faker{}

  fake.using_seed(36)

  first_word := fake.word() // same as second test's first word

  fake.clear_seed()

  second_word := fake.word() // Different than second test's second word
}

fn test_it_generates_the_same_word_as_first_test() {
  mut fake := Faker{}

  fake.using_seed(36)

  first_word := fake.word() // same as first test's first word

  fake.clear_seed()

  second_word := fake.word() // Different than first test's second word
}
```

[Back to examples](#examples)

## Q&A

- [Why is the fake variable mutable?](#why-is-the-fake-variable-mutable)
- [Why can't I use this module to compile my program to a single binary?]()

### Why is the fake variable mutable?

The `Fake{}` instance will use caching to improve subsequent call to the same function.

For example, calling 10 times `fake.first_name()` will read the total number of first names once, then it will hold the number of lines in cache.

This is to help pick a random index in the range [0, number of first names].

This also prevents to store a constant with the number of fake first names in the code. Note that this caching mecanism is shared across all your `fake := Faker{}` instances, which limits testing slowdown to the minimum on large test suites.

### Why can't I use this module to compile my program to a single binary?

Faker is a struct that takes its random values for a subset of its method from files.

This is done to help running tests on low RAM devices such as CI from Github Actions.

On a big test suite, your virtual memory consumption will be the least possible since each call to Faker method will parse the file it needs to read the data from line by line, holding a single line in memory (instead of mounting the whole 8kb+ file in memory).

Another reason is that to return plain values without error handling (`string` instead of `!string` for example), this package immediately calls `panic()` (for example if the text file used as data source is unreadable etc...).

**Open question**: Do you have this need? Should we move to embedding all fake values in V file (in source code)? Let me know your uses cases by opening an issue.

[Back to summary](#summary)
