# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- All `fake := Faker{}` instance now share a single cache and file opens are reduced on subsequent Fake data method call to improve performance.

## [0.1.0] - 2025-05-21

### Added

- First working version.
