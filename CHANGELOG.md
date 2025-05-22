# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

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
