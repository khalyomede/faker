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

- [Switching language](#switching-language)
- Fake data
  - Date
    - [Future date](#future-date)
    - [Past date](#past-date)
  - Identifiers
    - [UUID v4](#uuid-v4)
  - Text
    - [Sentence](#sentence)
    - [Word](#word)
  - Physical persons
    - [First name](#first-name)
    - [Last name](#last-name)
  - Other
    - [Boolean](#boolean)
    - [Random element](#random-element)
- [Extending/Custom fake data](#extendingcustom-fake-data)

### Switching language

```v
module test

import khalyomede.faker { Faker }

fn test_it_switches_language() {
  mut fake := Faker{lang: .en}

  // ...
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
  mut fake := Faker{}

  meeting_date := fake.future_date()

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

### Past date

```v
module test

import khalyomede.faker { Faker }

fn test_it_generates_past_date() {
  mut fake := Faker{}

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

### UUID v4

```v
module test

import khalyomede.faker { Faker }

fn test_it_returns_url() {
  mut fake := Faker{}

  payment_id := fake.uuid_v4()

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

## Q&A

- [Why is the fake variable mutable?](#why-is-the-fake-variable-mutable)
- [Why can't I use this module to compile my program to a single binary?]()

### Why is the fake variable mutable?

The `Fake{}` instance will use caching to improve subsequent call to the same function.

For example, calling 10 times `fake.first_name()` will read the total number of first names once, then it will hold the number of lines in cache.


This is to help pick a random index in the range [0, number of first names].

This also prevents to store a constant with the number of fake first names in the code.

_We could improve the performance by using a `__global` property, which allow sharing the cache across all test suites (not only per test suite), at the cost of forcing develpers to use the `v -enable-globals test .` flag when running their test suite._

_Let me know in an issue if you think this is a good idea._

### Why can't I use this module to compile my program to a single binary?

Faker is a struct that takes its random values for a subset of its method from files.

This is done to help running tests on low RAM devices such as CI from Github Actions.

On a big test suite, your virtual memory consumption will be the least possible since each call to Faker method will parse the file it needs to read the data from line by line, holding a single line in memory (instead of mounting the whole 8kb+ file in memory).

Another reason is that to return plain values without error handling (`string` instead of `!string` for example), this package immediately calls `panic()` (for example if the text file used as data source is unreadable etc...).

**Open question**: Do you have this need? Should we move to embedding all fake values in V file (in source code)? Let me know your uses cases by opening an issue.

[Back to summary](#summary)
