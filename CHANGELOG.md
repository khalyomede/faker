# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- City fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Zip code fake data ([#3](https://github.com/khalyomede/faker/issues/3)).

## [0.3.0] - 2025-05-29

### Added

- IP V4 fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Company name fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Visa credit card number fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- MAC address fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Currency symbol fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Currency code fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- User Agent (browser) fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Top level domain fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Base url fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Longtiude fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Latitude fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- EAN-13 fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Email fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Country name fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- Country code fake data ([#3](https://github.com/khalyomede/faker/issues/3)).
- u8/u16/u32/u64 fake data.
- i8/i16/i32/i64 fake data.
- f32/f64 fake data.
- u8/u16/u32/u64 "between" fake data.
- i8/i16/i32/i64 "between" fake data.
- f32/f64 "between" fake data.

### Fixed

- No more "unused import" warning when compiling or running a program that imports this package ([#1](https://github.com/khalyomede/faker/issues/1)).
- `fake.boolean()` will now have a chance to produce `false` (instead of always picking `true`) ([#5](https://github.com/khalyomede/faker/issues/5)).
- `fake.random_element()` will now have a chance to pick the last value (previously if you had `fake.random_element(['banana', 'apple', 'cherry'])`, it would only pick between "banana" or "apple" and never "cherry") ([#5](https://github.com/khalyomede/faker/issues/5)).
- `fake.random_element()` will now correctly follow the seed, such as two fake instances sharing the same seed (`fake.using_seed(56)`) will pick the same random elements.

### [0.2.0] - 2025-05-22

### Added

- All `fake := Faker{}` instance now share a single cache and file opens are reduced on subsequent Fake data method call to improve performance.
- New `fake.using_lang(.en)` method to switch language after generating fake data in another lang.
- Add a way to make the random values deterministic (seed), meaning two differents instance of `fake := Faker{}` will generate the same random values by setting their seed using `fake.using_seed(36)`. You can go back to the original behavior (completely unique values) using `fake.clear_seed()`.

### Fixed

- The library will now pick from all available (1000) data for file data based methods like `fake.sentence()` or `fake.word()` instead of a fraction (256) of the available fake data.

## [0.1.0] - 2025-05-21

### Added

- First working version.
